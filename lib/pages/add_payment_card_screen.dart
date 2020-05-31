import 'package:capitalvotes/blocs/payment_card.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:provider/provider.dart';

class AddPaymentCardScreen extends StatefulWidget {
  @override
  _AddPaymentCardScreenState createState() => _AddPaymentCardScreenState();
}

class _AddPaymentCardScreenState extends State<AddPaymentCardScreen> {
  final AppBar mainAppBar = AppBar(
    leading: IconButton(
        icon: Icon(Icons.keyboard_backspace),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {}),
    title: Text(
      'Add card',
      style: display2TextStyle.copyWith(color: Colors.white),
    ),
    elevation: 0.0,
    backgroundColor: capitalVotesTheme().primaryColor,
  );

//  Country _selectedCountry;

  final _formKey = GlobalKey<FormState>();
  String userCardNum;
  String userExpiryDate;
  String userVerificationValue;
  bool isVisa = false;
  Country _selected;
  String userCountry;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    _save(userProfileBloc) {
      PaymentCard paymentCard = new PaymentCard();
      paymentCard.verificationValue = userVerificationValue;
      paymentCard.expiryDate = userExpiryDate;
      paymentCard.cardNum = userCardNum;
      paymentCard.country = userCountry;
      userProfileBloc.addPaymentCardToList(paymentCard);
    }

//    detectCardType(String cardNum) {
//      RegExp regExpVisa = RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$');
//      if (regExpVisa.firstMatch(cardNum) != null) {
//          debugPrint('it is a visa card');
//      }
//    }
//    String testIt = '4012888888881881';
//    print(detectCardType(testIt));


    return Scaffold(
      appBar: mainAppBar,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  maxiInputLabel('Card Number'),
                  SizedBox(
//                    CARD NUMBER TEXT FIELD
                    child: TextFormField(
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.8),
                      decoration: formInputDecoration(
                              'Enter card number', bigInnerPadding)
                          .copyWith(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Image(
                            width: 40.0,
                            height: 40.0,
                            image: AssetImage( isVisa
                                ? PaymentMethodImages().promoCodeImgUrl
                                : PaymentMethodImages().mcImgUrl),
                          ),
                        ),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(19),
                        CustomInputFormatter(
                          mask: 'xxxx xxxx xxxx xxxx',
                          separator: ' ',
                        ),
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                        signed: false,
                        decimal: false,
                      ),
                      onChanged: (value) {
                        setState(() {
                          userCardNum = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your card number';
                        }
                        if (value.length < 19) {
                          return 'Please enter your card number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              miniInputLabel('Expiry Date'),
                              SizedBox(
                                width: miniInputWidth,
                                child: TextFormField(
                                  style: miniInputStyle,
                                  decoration: formInputDecoration(
                                      'MM/YY', smallInnerPadding),
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(5),
                                    CustomInputFormatter(
                                        mask: 'xx/xx', separator: '/'),
                                  ],
                                  keyboardType: TextInputType.datetime,
                                  onChanged: (value) {
                                    setState(() {
                                      userExpiryDate = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your card number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              miniInputLabel('Verification Value'),
                              SizedBox(
                                width: miniInputWidth,
                                child: TextFormField(
                                  style: miniInputStyle,
                                  decoration: formInputDecoration(
                                      'CVV', smallInnerPadding),
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(3)
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      userVerificationValue = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your card number';
                                    }
                                    if (value.length < 3) {
                                      return 'This is not three letters long';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  miniInputLabel('Country'),
                  Container(
                    width: screenWidth,
                    padding: smallInnerPadding,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[200],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CountryPicker(
                      dense: false,
                      showFlag: true,
                      //displays flag, true by default
                      showDialingCode: false,
                      //displays dialing code, false by default
                      showName: true,
                      //displays country name, true by default
                      showCurrency: false,
                      //eg. 'British pound'
                      showCurrencyISO: false,
                      //eg. 'GBP'
                      onChanged: (Country country) {
                        setState(() {
                          _selected = country;
                          userCountry = country.name;
                        });
                      },
                      selectedCountry: _selected,
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text('ADD CARD'),
            color: userCardNum != null &&
                    userVerificationValue != null &&
                    userExpiryDate != null
                ? capitalVotesTheme().primaryColor
                : Color(0x65E5306C),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.reset();
                _formKey.currentState.save();
                _save(userProfileBloc);
              }
            },
          ),
        ],
      ),
    );
  }
}
