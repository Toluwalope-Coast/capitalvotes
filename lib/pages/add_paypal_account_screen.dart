import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capitalvotes/shared/form_util.dart';



class AddPayPalAccountScreen extends StatefulWidget {
  @override
  _AddPayPalAccountScreenState createState() => _AddPayPalAccountScreenState();
}

class _AddPayPalAccountScreenState extends State<AddPayPalAccountScreen> {
  final AppBar mainAppBar = AppBar(
    leading: IconButton(
        icon: Icon(Icons.keyboard_backspace),
        iconSize: 30.0,
        color: Colors.black,
        onPressed: () {}),
    title: Text(
      'Add Paypal Account',
      style: display2TextStyle,
    ),
    elevation: 0.0,
    backgroundColor: Colors.grey[100],
  );

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



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: mainAppBar,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0,
          0.0),
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
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10.0)),
          maxiInputLabel('Shipping Address'),
//        Street Address
          SizedBox(
            height: 50.0,
            child: TextFormField(
              decoration:
                  formInputDecoration('street address', smallInnerPadding)
                      .copyWith(
                filled: true,
                fillColor: Colors.white,
                hintStyle: _hintStyle,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
//           Street Address line 2
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              height: 50.0,
              child: TextFormField(
                decoration: formInputDecoration(
                        'street address line 2', smallInnerPadding)
                    .copyWith(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: _hintStyle,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
//          City // State/ Province
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
                      decoration: formInputDecoration('City', smallInnerPadding)
                          .copyWith(
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: _hintStyle,
                      ),
                    ),
                  ),
                ),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
//          TODO fix dropdown is not resizing to match
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
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20.0)),
//          DropdownButtonFormField(
//            decoration: formInputDecoration(null, null).copyWith(
//              filled: true,
//              fillColor: Colors.white,
//            ),
//            value: _selectedCountry,
//            hint: Text(
//              'Country',
//              style: _hintStyle,
//            ),
//            icon: Icon(CupertinoIcons.down_arrow),
//            iconSize: 18.0,
//            onChanged: (Country newValue) {
//              setState(() {
//                _selectedCountry = newValue;
//              });
//            },
//            items: countries.map((Country country) {
//              return DropdownMenuItem(
//                child: SizedBox(
//                  height: 50.0,
//                  child: Row(
//                    children: <Widget>[
//                      Image(
//                        height: 20.0,
//                        image: AssetImage(country.countryFlagImgUrl),
//                      ),
//                      SizedBox(
//                        width: 20.0,
//                      ),
//                      Text(
//                        country.countryName,
//                        style: miniFormTxtStyle,
//                      ),
//                    ],
//                  ),
//                ),
//                value: country,
//              );
//            }).toList(),
//          ),
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
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
