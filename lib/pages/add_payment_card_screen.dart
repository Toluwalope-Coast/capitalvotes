import 'package:capitalvotes/blocs/payment_card.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/shared/constants.dart';
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
  String userVerificationValue;
  String userCardFirstName;
  String userCardLastName;
  String userCardNum;
  String userMonth;
  String userYear;
  String userPhoneNumber;
  String userEmail;
  bool isType;
  CardType userCardType;
  Country _selected;

// Form key
  final _formKey = GlobalKey<FormState>();

// Input controllers
  TextEditingController cardNumberController = TextEditingController();

// variables
  bool _autoValidate = false;

//  instantiate new payment card
  PaymentCard paymentCard = new PaymentCard();

  @override
  void initState() {
    super.initState();
    //  Default country
    _selected = Country.US;
    // Default card image
    userCardType = CardType.others;
//    Listen and detect card
    cardNumberController.addListener(getCardType);
//    set switch
    isType = false;
  }

//  Helper method to get date requirements
  getDateRequirements(value) {
    List monthYearDateList = CardUtil.expiryDateList(value);
    setState(() {
      userMonth = monthYearDateList[0];
      userYear = monthYearDateList[1];
    });
  }

//  Helper method to get card type
  getCardType() {
    String number = cardNumberController.text;
    String cleanedNumber = CardUtil.cleanCardNumber(number);
    CardType cardType = CardUtil.cardTypeFromNumber(cleanedNumber);
    setState(() {
      userCardType = cardType;
    });
  }

//  Helper method to get img url of card type
  String getCardTypeImgUrl(cardType) {
    switch (cardType) {
      case CardType.masterCard:
        return PaymentCardImgUrls.mcImgUrl;
        break;
      case CardType.visa:
        return PaymentCardImgUrls.visaImgUrl;
        break;
      case CardType.verve:
        return PaymentCardImgUrls.aeColorImgUrl;
        break;
      case CardType.others:
        return PaymentCardImgUrls.promoCodeImgUrl;
        break;
    }
    return PaymentCardImgUrls.promoCodeImgUrl;
  }

//  widgets
  AppBar _screenAppBar(context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            popGoTo(context, '/PaymentMethodScreen');
          }),
      title: Text(
        'Add card',
        style: display2TextStyle.copyWith(color: Colors.white),
      ),
      elevation: 0.0,
      backgroundColor: capitalVotesTheme().primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    _save(userProfileBloc) {
      paymentCard.verificationValue = userVerificationValue;
      paymentCard.expiryMonth = userMonth;
      paymentCard.expiryYear = userYear;
      paymentCard.firstName = userCardFirstName;
      paymentCard.lastName = userCardLastName;
      paymentCard.cardNum = userCardNum;
      paymentCard.country = _selected.name;
      paymentCard.currency = _selected.currency;
      paymentCard.email = userProfileBloc.getEmail;
      paymentCard.cardVendorImageUrl = getCardTypeImgUrl(userCardType);
//    add card instance to list
      userProfileBloc.addPaymentCardToList(paymentCard);
    }

    bool _formReady = (userVerificationValue != null &&
        userMonth != null &&
        userYear != null &&
        userCardLastName != null &&
        userCardFirstName != null &&
        userCardNum != null &&
        _selected != null);

    bool _setType(value) {
      if (isType = value) {
        setState(() {
          isType = value;
          paymentCard.isCredit = value;
        });
      } else {
        setState(() {
          isType = value;
          paymentCard.isCredit = value;
        });
      }
      return isType;
    }

    return Scaffold(
      appBar: _screenAppBar(context),
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
                          child: CardUtil.cardImage(cardType: userCardType),
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
                      controller: cardNumberController,
                      onChanged: (value) {
                        setState(() {
                          userCardNum = CardUtil.cleanCardNumber(value);
                        });
                      },
                      validator: CardUtil.validateCardNum,
                    ),
                  ),
//                  name
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
                              miniInputLabel('First Name'),
                              SizedBox(
                                width: miniInputWidth + 20,
                                child: TextFormField(
                                  style: miniInputStyle,
                                  decoration: formInputDecoration(
                                      'First Name', smallInnerPadding),
                                  inputFormatters: <TextInputFormatter>[],
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    setState(() {
                                      userCardFirstName = value;
                                    });
                                  },
                                  validator: CardUtil.validateFirstName,
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
                              miniInputLabel('Last Name'),
                              SizedBox(
                                width: miniInputWidth + 50,
                                child: TextFormField(
                                  style: miniInputStyle,
                                  decoration: formInputDecoration(
                                      'Last Name', smallInnerPadding),
                                  inputFormatters: <TextInputFormatter>[],
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    setState(() {
                                      userCardLastName = value;
                                    });
                                  },
                                  validator: CardUtil.validateLastName,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
//                  cvv ex date
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
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    CardDateInputFormatter(),
                                  ],
                                  keyboardType: TextInputType.datetime,
                                  onChanged: (value) {
                                    getDateRequirements(value);
                                  },
                                  validator: CardUtil.validateExpiryDate,
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
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(3),
                                    WhitelistingTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      userVerificationValue = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  validator: CardUtil.validateCVV,
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
                        });
                      },
                      selectedCountry: _selected,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  SwitchListTile.adaptive(
                    title: Text('Credit card?', style: miniFormTxtStyle),
                    value: isType,
                    activeColor: capitalVotesTheme().primaryColor,
                    onChanged: (bool value) {
                      setState(() {
                        _setType(value);
                        print(value);
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text('ADD CARD'),
            color: _formReady
                ? capitalVotesTheme().primaryColor
                : Color(0x65E5306C),
            textColor: Colors.white,
            elevation: _formReady ? 2.0 : 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
            onPressed: _formReady
                ? () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.reset();
                      _formKey.currentState.save();
                      _save(userProfileBloc);
                      popGoTo(context, '/PaymentMethodScreen');
                    } else {
                      _autoValidate = true;
                    }
                  }
                : () {},
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // dispose controller
    cardNumberController.removeListener(getCardType);
    cardNumberController.dispose();
    super.dispose();
  }
}
