import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
* THIS FILE CONTAINS ALL GENERAL STYLES FOR FORMS IN THE APP INCLUDING STYLES
*  FOR THE TEXT LABEL ABOVE THEM
*
* NOTE: THIS ONLY HELPS IN BUILDING A CONSISTENT UI REGARDING FORMS IN THE
* APP ALL METHODS AND FUNCTION ARE NOT HANDLED HERE
*
* MOST FORM PROPERTIES TO AID WITH BUILDING FORMS IN THE APP ARE HERE
*
*
*/
const display2TextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);
// CONSTANTS AND VARIABLES THAT RELATE TO FORMS IN APP UI
// Size of small INPUTS
double miniInputWidth = 140.0;

/*
*
*
*
*
*
*/

class PaymentMethodImages {
// CREDIT/DEBIT CARD VENDOR IMAGES
// master card
  String mcDarkImgUrl = 'images/payment_icons/mastercard-dark-large.png';
  String mcImgUrl = 'images/payment_icons/mastercard.png';

// american express
  String aeColorImgUrl = 'images/payment_icons/americanexpress-color-large.png';

// PayPal
  String payPalImgUrl = 'images/payment_icons/paypal.png';

// Visa
  String visaImgUrl = 'images/payment_icons/visa-color_large.png';

// Gift Card Image
  String promoCodeImgUrl = 'images/payment_icons/gift_card.png';

}

/*
*
*
*
*
*
*/

// INNER PADDING FOR FORM FIELDS
EdgeInsets bigInnerPadding = EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0);
EdgeInsets smallInnerPadding = EdgeInsets.fromLTRB(15.0, 20.0, 20.0, 20.0);

/*
*
*
*
*
*
*/

// FORM BORDER STYLES
// default border style
OutlineInputBorder formBorderDefault = OutlineInputBorder(
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.grey[200],
  ),
  borderRadius: BorderRadius.circular(10.0),
);

//border style when input is in focus
OutlineInputBorder formBorderFocused = formBorderDefault.copyWith(
  borderSide: BorderSide(
    color: capitalVotesTheme().primaryColor,
    width: 2.0,
  ),
);

// border style for input error
OutlineInputBorder formBorderError = formBorderDefault.copyWith(
  borderSide: BorderSide(
    color: CupertinoColors.destructiveRed,
    width: 2.0,
  ),
);

/*
*
*
*
*
*
*/

//GENERAL DECORATION FOR INPUT FIELDS
InputDecoration formInputDecoration(String hintText, EdgeInsets padding) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: padding,
    enabledBorder: formBorderDefault,
    focusedBorder: formBorderFocused,
    errorBorder: formBorderError,
  );
}

/*
*
*
*
*
*
*/

//TEXT STYLES
//For smaller INPUTS
TextStyle miniInputStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 12.8);

TextStyle miniFormTxtStyle = display2TextStyle.copyWith(fontSize: 14.0);

/*
*
*
*
*
*
*/

// SMALLER LABEL FOR INPUT
Widget miniInputLabel(String title) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.0),
    child: Text(
      title,
      style: miniFormTxtStyle,
    ),
  );
}

// LARGER LABEL FOR INPUT
Widget maxiInputLabel(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    child: Text(
      title,
      style: display2TextStyle,
    ),
  );
}

// Input formatter for forms

class CustomInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  CustomInputFormatter({@required this.mask, @required this.separator}) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
