import 'package:capitalvotes/blocs/payment_card.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:provider/provider.dart';

class AddPayPalAccountScreen extends StatefulWidget {
  @override
  _AddPayPalAccountScreenState createState() => _AddPayPalAccountScreenState();
}

class _AddPayPalAccountScreenState extends State<AddPayPalAccountScreen> {
  final _hintStyle = miniInputStyle.copyWith(
    fontWeight: FontWeight.w600,
    color: Colors.grey[400],
  );

  void _validateInput() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

//  Country _selectedCountry;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String userFirstName;
  String userLastName;
  String userEmail;
  String userStreetAddress1;
  String userStreetAddress2;
  String userCity;
  String userState;
  String userZipCode;
  String userCountry;
  Country defaultCountry = Country.US;
  Country _selected;

  _multiLineNav(title) => navigateToMultilineText(context, title);
  @override
  Widget build(BuildContext context) {
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    AppBar mainAppBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.keyboard_backspace),
        iconSize: 30.0,
        color: Colors.black,
        onPressed: () {
          popGoTo(context, '/PaymentMethodScreen');
        },
      ),
      title: Text(
        'Add Paypal Account',
        style: display2TextStyle,
      ),
      elevation: 0.0,
      backgroundColor: Colors.grey[100],
    );


    _save(userProfileBloc) {
      PaymentCard paymentCard = new PaymentCard();
      paymentCard.firstName = userFirstName;
      paymentCard.lastName = userLastName;
      paymentCard.email = userEmail;
      paymentCard.streetAddress1 = userStreetAddress1;
      paymentCard.streetAddress2 = userStreetAddress2;
      paymentCard.city = userCity;
      paymentCard.state = userState;
      paymentCard.zipCode = userZipCode;
      paymentCard.country = _selected = null ? defaultCountry : userCountry;
      paymentCard.isPayPal = true;

//      ADD PAYMENT CARD INSTANCE TO LIST OF PAYMENT CARDS
      userProfileBloc.addPaymentCardToList(paymentCard);

      print(
          'the length of paymentCardList : ${userProfileBloc.paymentCardList.length}');
      print(
          'the selected  country : ${paymentCard.country}');
      print('the entered city is: ${paymentCard.city}');
      print('the entered zipCode is: ${paymentCard.zipCode}');
      print('the first street address is: ${paymentCard.streetAddress2}');
      print('the second street address is: ${paymentCard.streetAddress1}');
      print('the entered first name is: ${paymentCard.firstName}');
      print('the entered last name is: ${paymentCard.lastName}');
      print('the entered email is: ${paymentCard.email}');
      print('the entered state is: ${paymentCard.state}');
    }

    return Scaffold(
      appBar: mainAppBar,
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          children: <Widget>[
            maxiInputLabel('Holder Name'),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
//          Name Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    width: miniInputWidth + 25.0,
                    height: 50.0,
                    child: TextFormField(
                      decoration:
                          formInputDecoration('First Name', smallInnerPadding)
                              .copyWith(
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: _hintStyle,
                      ),
                      onChanged: (value) {
                      setState(() {
                        userFirstName = value;
                      });
                    },
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: miniInputWidth + 25.0,
                    height: 50.0,
                    child: TextFormField(
                      decoration:
                          formInputDecoration('Last Name', smallInnerPadding)
                              .copyWith(
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: _hintStyle,
                      ),
                      onChanged: (value) {
                        setState(() {
                          userLastName = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 8.0)),
            maxiInputLabel('Holder E-mail'),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
//          Email
            SizedBox(
              height: 50.0,
              child: TextFormField(
                decoration: formInputDecoration(
                        'something@example.com', smallInnerPadding)
                    .copyWith(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: _hintStyle,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    userEmail = value;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            maxiInputLabel('Shipping Address'),
//        Street Address
            SizedBox(
              height: 50.0,
              child: InkWell(
                onTap: _multiLineNav('street address 1'),
                child: TextFormField(
                  decoration:
                      formInputDecoration('street address', smallInnerPadding)
                          .copyWith(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: _hintStyle,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      userStreetAddress1 = value;
                    });
                  },
                ),
              ),
            ),
//           Street Address line 2
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 50.0,
                child: TextFormField(
                  decoration: formInputDecoration(
                          'street address line 2 i think  you are scrollable so are you scrollable i dont know i dont care', smallInnerPadding)
                      .copyWith(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: _hintStyle,
                  ),
//                  keyboardType: TextInputType,
                  onChanged: (value) {
                    setState(() {
                      userStreetAddress2 = value;
                    });
                  },
                ),
              ),
            ),
//          CITY
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: SizedBox(
                      width: miniInputWidth - 20.0,
                      height: 50.0,
                      child: TextFormField(
                        decoration:
                            formInputDecoration('City', smallInnerPadding)
                                .copyWith(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: _hintStyle,
                        ),
                      ),
                    ),
                  ),
                  // STATE / PROVINCE
                  Expanded(
                    child: SizedBox(
                      width: miniInputWidth + 25.0,
                      height: 50.0,
                      child: TextFormField(
                        decoration: formInputDecoration(
                                'State / Province', smallInnerPadding)
                            .copyWith(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: _hintStyle,
                        ),
                        onChanged: (value) {
                          setState(() {
                            userCity = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
//       POSTAL / ZIP-CODE
            SizedBox(
              height: 50.0,
              child: TextFormField(
                decoration:
                    formInputDecoration('Postal/ Zip Code', smallInnerPadding)
                        .copyWith(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: _hintStyle,
                ),
                onChanged: (value) {
                  setState(() {
                    userZipCode = value;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
//            COUNTRY PICKER
            Container(
              width: screenWidth,
              padding: smallInnerPadding,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[200],
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CountryPicker(
                dense: false,
                showFlag: true,
                showDialingCode: false,
                showName: true,
                showCurrency: false,
                showCurrencyISO: false,
                onChanged: (Country country) {
                  setState(() {
                    _selected = country;
                    userCountry = country.name;
                  });
                },
                selectedCountry: _selected,
              ),
            ),
//  SAVE BUTTON
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: RaisedButton(
                child: Text('SAVE'),
                color: capitalVotesTheme().primaryColor,
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
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
