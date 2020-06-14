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

  String userFirstName;
  String userLastName;
  String accountNickName;
  String userEmail;
  String userStreetAddress1;
  String userStreetAddress2;
  String userCity;
  String userState;
  Country _selected;
  @override
  void initState() {
    super.initState();
    _selected = Country.US;
  }

//  Form Key
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

//  _multiLineNav(title) => navigateToMultilineText(context, title);
  @override
  Widget build(BuildContext context) {
//    User profile bloc
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);
//    Get Device Size and Height for Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
//    ---------------- HELPER Widgets
// APP BAR
    AppBar mainAppBar = AppBar(
      automaticallyImplyLeading: true,
//      leading: IconButton(
//        icon: Icon(Icons.keyboard_backspace),
//        iconSize: 30.0,
//        color: Colors.black,
//        onPressed: () {
//          popGoTo(context, '/PaymentMethodScreen');
//        },
//      ),
      title: Text(
        'Add Paypal Account',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0.0,
      backgroundColor: capitalVotesTheme().primaryColor,
    );
//    --------------- HELPER Functions
// SAVE FORM Function
    _save(userProfileBloc) {
      PaymentCard paymentCard = new PaymentCard();
      paymentCard.firstName = userFirstName;
      paymentCard.lastName = userLastName;
      paymentCard.email = userEmail;
      paymentCard.streetAddress1 = userStreetAddress1;
      paymentCard.streetAddress2 = userStreetAddress2;
      paymentCard.city = userCity;
      paymentCard.state = userState;
      paymentCard.isPayPal = true;
      paymentCard.zipCode = _selected.dialingCode;
      if (_selected != null) {
        paymentCard.country = Country.US.name;
        paymentCard.currency = Country.US.currency;
      }
      paymentCard.country = _selected.name;
      paymentCard.currency = _selected.currency;

//      ADD PAYMENT CARD INSTANCE TO LIST OF PAYMENT CARDS
      userProfileBloc.addPaymentCardToList(paymentCard);

      print(
          'the length of paymentCardList : ${userProfileBloc.paymentCardList.length}');
      print('the selected  country : ${paymentCard.country}');
      print('the entered city is: ${paymentCard.city}');
      print('the entered zipCode is: ${paymentCard.zipCode}');
      print('the first street address is: ${paymentCard.streetAddress2}');
      print('the second street address is: ${paymentCard.streetAddress1}');
      print('the entered first name is: ${paymentCard.firstName}');
      print('the entered last name is: ${paymentCard.lastName}');
      print('the entered email is: ${paymentCard.email}');
      print('the entered state is: ${paymentCard.state}');
    }

// Condition to show save button
    bool _formReady = (userFirstName != null &&
        userLastName != null &&
        userEmail != null &&
        userStreetAddress1 != null &&
        userStreetAddress2 != null &&
        userCity != null &&
        userState != null &&
        _selected != null);

    return Scaffold(
      appBar: mainAppBar,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                maxiInputLabel('Holder Name'),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
//          Name Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: miniInputWidth + 25.0,
                      child: TextFormField(
                        autovalidate: _autoValidate,
                        style: miniInputStyle.copyWith(
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                        decoration:
                            formInputDecoration('First Name', smallInnerPadding)
                                .copyWith(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: _hintStyle,
                          border: InputBorder.none,
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                          ),
                          errorMaxLines: 2,
                          focusedErrorBorder: formBorderError,
                        ),
                        onChanged: (value) {
                          setState(() {
                            userFirstName = value;
                          });
                        },
                        inputFormatters: [
                          WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: miniInputWidth + 25.0,
                      child: TextFormField(
                        style: miniInputStyle,
                        autovalidate: _autoValidate,
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
                        inputFormatters: [
                          WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                maxiInputLabel('Holder E-mail'),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
//          Email
                SizedBox(
//                  height: 50.0,
                  child: TextFormField(
                    style: miniInputStyle,
                    autovalidate: _autoValidate,
                    decoration: formInputDecoration(
                      'something@example.com',
                      smallInnerPadding,
                    ).copyWith(
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'enter email address';
                      }
                      if (!emailRegExp.hasMatch(value)) {
                        return 'the email address is invalid';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
                maxiInputLabel('Shipping Address'),
//        Street Address
                SizedBox(
//                  height: 50.0,
                  child: TextFormField(
                    style: miniInputStyle,
                    autovalidate: _autoValidate,
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'enter address';
                      }
                      return null;
                    },
                  ),
                ),
//           Street Address line 2
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
//                    height: 50.0,
                    child: TextFormField(
                      style: miniInputStyle,
                      autovalidate: _autoValidate,
                      decoration: formInputDecoration(
                              'street address line 2', smallInnerPadding)
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enter address';
                        }
                        return null;
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
                          child: TextFormField(
                            style: miniInputStyle,
                            autovalidate: _autoValidate,
                            decoration:
                                formInputDecoration('City', smallInnerPadding)
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter City';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      // STATE / PROVINCE
                      Expanded(
                        child: SizedBox(
                          width: miniInputWidth + 25.0,
                          child: TextFormField(
                            style: miniInputStyle,
                            autovalidate: _autoValidate,
                            decoration: formInputDecoration(
                                    'State / Province', smallInnerPadding)
                                .copyWith(
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: _hintStyle,
                            ),
                            onChanged: (value) {
                              setState(() {
                                userState = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter state/province';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
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
                    showDialingCode: true,
                    showName: true,
                    showCurrency: false,
                    showCurrencyISO: false,
                    onChanged: (Country country) {
                      setState(() {
                        _selected = country;
                      });
                    },
                    selectedCountry: _selected,
                  ),
                ),
              ],
            ),
          ),

//  SAVE BUTTON
          _formReady
              ? Padding(
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
                        _save(userProfileBloc);
                        _formKey.currentState.save();
                        _formKey.currentState.reset();
                        popGoTo(context, '/PaymentMethodScreen');
                      } else {
                        _autoValidate = true;
                      }
                    },
                  ),
                )
              : SizedBox(),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
