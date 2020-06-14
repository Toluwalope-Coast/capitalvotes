import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/constants.dart';

class AddPromoCodeScreen extends StatefulWidget {
  @override
  _AddPromoCodeScreenState createState() => _AddPromoCodeScreenState();
}

class _AddPromoCodeScreenState extends State<AddPromoCodeScreen> {
  String promoCode;
  String _promoCodeValidation(String value) {
    if (value.length != 6) {
      return 'Promo Code must be 6 letters';
    }
    return null;
  }

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

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final AppBar mainAppBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {
            popGoTo(context, '/PaymentMethodScreen');
          }),
      title: Text(
        'Promotions',
        style: display2TextStyle,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
    return Scaffold(
      appBar: mainAppBar,
      body: ListView(
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0,
            0.0),
        children: <Widget>[
          maxiInputLabel('Enter promo code'),
          Form(
            key: _formKey,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: TextFormField(
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                decoration:
                    formInputDecoration('Enter Promo Code', smallInnerPadding)
                        .copyWith(
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[300],
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(6)
                ],
                autovalidate: _autoValidate,
                validator: _promoCodeValidation,
                onSaved: (String value) {
                  promoCode = value;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Text(
              'Promo code will be applied in your next vote',
              style: display2TextStyle.copyWith(color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 270.0,
          ),
          FractionallySizedBox(
            widthFactor: 0.99,
            child: RaisedButton(
              child: Text('SAVE'),
              color: capitalVotesTheme().primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0),
              onPressed: _validateInput,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
