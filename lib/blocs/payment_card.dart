import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/form_util.dart';

class PaymentCard {
  String cardNum;
  CardType cardType;
  bool isCredit = true;
  bool isSelected = false;
  bool isPayPal = false;
  String city;
  String email;
  String state;
  String zipCode;
  String country;
  String currency;
  String lastName;
  String firstName;
  String expiryMonth;
  String expiryYear;
  String streetAddress1;
  String streetAddress2;
  String verificationValue;
  String cardVendorImageUrl;

//  mainly to show the user what type of card they are using
  getType() {
    if (isCredit) {
      return '(Credit)';
    } else {
      return '(Debit)';
    }
  }
}

/*
The static keyword denotes that a member variable,
or method,
can be accessed without requiring an instantiation of the class to which it belongs.
In simple terms,
it means that you can call a method,
even if you've never created the object to which it belongs!
*/

// create a card utilities class to help with card validation and processing
class CardUtil {
//  Helper method to validate name
  static String validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Please enter first name on bank card';
    }
    return null;
  }

  static String validateLastName(String value) {
    if (value.isEmpty) {
      return 'Please enter last name on bank card';
    }
    return null;
  }

// Helper method to validate CVVs
  static String validateCVV(String value) {
    if (value.isEmpty) {
      return 'Please enter CVV';
    }
    if (value.length < 3) {
      return 'The CVV num is 3 letters long';
    }
    return null; //for validator in TextFormFiled widget
  }

//  CARD EXPIRY DATE SECTION
//  Helper method to validate expiry date
  static String validateExpiryDate(String value) {
    if (value.isEmpty) {
      return 'Please enter card expiry date';
    }

//  initialize expiryMonth and expiryYear
    int expiryYear;
    int expiryMonth;

//    Helper method to split date and pass it as int
    RegExp dateValidationRegExp = RegExp(r'(\/)');
    if (value.contains(dateValidationRegExp)) {
      var splitDateArray = value.split(dateValidationRegExp);
      expiryMonth = int.parse(splitDateArray[0]);
      expiryYear = int.parse(splitDateArray[1]);
    }

//    Helper method to validate expiryMonth
    if (expiryMonth < 1 || expiryMonth > 12) {
      // only 12 months any other num is invalid
      return 'Expiry month is invalid';
    }

//    Helper method to validate expiryYear
    if ((expiryYear < 1) || (expiryYear > 99)) {
//      Assuming the valid value should be between 1 and 99
      return 'Expiry year is invalid';
    }

    // validate if card has expired through date
    if (dateHasExpired(expiryMonth, expiryYear)) {
      return "Card has expired";
    }

    return null;
  }

// Helper method to produce month and year as list
  static List<String> expiryDateList(String value) {
    List split = value.split(RegExp(r'(\/)'));
    return [split[0].toString(), split[1].toString()];
  }

//  Helper method to convert the 2 digit year to 4 digits
  static int convertYearTo4Digits(year) {
    DateTime now = DateTime.now();
    String currentYear = now.year.toString();
    String prefix = currentYear.substring(0, currentYear.length - 2);
    year = int.parse('$prefix${year.toString()}');
    return year;
  }

//  Helper methods to find out if date is expired
  static bool dateHasExpired(int month, int year) {
//    decide if
    return yearHasExpired(year) && monthHasExpired(month, year);
  }

  static bool monthHasExpired(int month, int year) {
    int expiryYearIn4Digits = convertYearTo4Digits(year);
    int currentMonth = DateTime.now().month;
    int currentYear = DateTime.now().year;
    bool monthHasPassed =
        currentYear == expiryYearIn4Digits && month < currentMonth;

    return yearHasExpired(year) || monthHasPassed;
  }

  static bool yearHasExpired(int year) {
    int expiryYearIn4Digits = convertYearTo4Digits(year);
    int currentYear = DateTime.now().year;
    int diff = expiryYearIn4Digits - currentYear;
    return diff > 3 ||
        expiryYearIn4Digits > currentYear + 3 ||
        expiryYearIn4Digits < currentYear;

    /*
    If
    the difference between userEnteredYear and the currentYear is > 3 - expired
    the userEnteredYear is > the currentYear + 3 - expired
    the userEnteredYear is < currentYear - expired
    the userEnteredYear is = currentYear - may or may-not have expired(just let it through)

    */
  }

//  CARD NUMBER SECTION
//  Removes spaces from formatted card number
  static String cleanCardNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  // Validate the card number with Luhn Algorithm
  // https://en.wikipedia.org/wiki/Luhn_algorithm
  static String validateCardNum(String cardNumber) {
    if (cardNumber.isEmpty) {
      return 'This field is required';
    }

    cardNumber = cleanCardNumber(cardNumber);

//    if (cardNumber.length < 19) {
//      return 'Card number is invalid';
//    }

    int sum = 0;
    int length = cardNumber.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(cardNumber[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Card number is fake';
  }

//
/*
 AssetImage(PaymentMethodImages().mcImgUrl)
 */
  static Widget cardImage({CardType cardType}) {
    Icon icon;
    Widget widget;
    String img = "";
    switch (cardType) {
      case CardType.masterCard:
        img = PaymentCardImgUrls.mcImgUrl;
        break;
      case CardType.visa:
        img = PaymentCardImgUrls.visaImgUrl;
        break;
      case CardType.verve:
        img = PaymentCardImgUrls.aeColorImgUrl;
        break;
      case CardType.others:
        icon = Icon(
          Icons.credit_card,
          size: 25.0,
          color: CupertinoColors.activeBlue,
        );
        break;
      case CardType.invalid:
        icon = Icon(
          Icons.cancel,
          size: 25.0,
          color: Colors.redAccent,
        );
        break;
    }
    if (img.isNotEmpty) {
      widget = Image.asset(
        '$img',
        width: 40.0,
        height: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static CardType cardTypeFromNumber(String cardNumber) {
    CardType cardType;
    RegExp masterCardRegExp = RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))');
    RegExp visaRegExp = RegExp(r'[4]');
    RegExp verveRegExp = RegExp(r'((506(0|1))|(507(8|9))|(6500))');
    if (cardNumber.startsWith(masterCardRegExp)) {
      cardType = CardType.masterCard;
    } else if (cardNumber.startsWith(visaRegExp)) {
      cardType = CardType.visa;
    } else if (cardNumber.startsWith(verveRegExp)) {
      cardType = CardType.verve;
    } else if (cardNumber.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }
    return cardType;
  }
}

enum CardType { masterCard, visa, verve, others, invalid }
