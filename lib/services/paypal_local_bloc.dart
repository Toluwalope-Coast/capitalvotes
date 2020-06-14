import 'package:flutter/material.dart';

class PayPalLocalBloc extends ChangeNotifier {
  String _userFirstName;
  String _userLastName;
  String _userEmail;
  String _userStreetAddress1;
  String _userStreetAddress2;
  String _userCity;
  String _userState;
  String _userZipCode;
  String _userCountry;
  String _defaultCountry = 'United States';

  String get userFirstName => _userFirstName;

  set userFirstName(String value) {
    _userFirstName = value;
    notifyListeners();
  }

  String _selected;

  String get userLastName => _userLastName;

  set userLastName(String value) {
    _userLastName = value;
    notifyListeners();
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  String get userStreetAddress1 => _userStreetAddress1;

  set userStreetAddress1(String value) {
    _userStreetAddress1 = value;
    notifyListeners();
  }

  String get userStreetAddress2 => _userStreetAddress2;

  set userStreetAddress2(String value) {
    _userStreetAddress2 = value;
    notifyListeners();
  }

  String get userCity => _userCity;

  set userCity(String value) {
    _userCity = value;
    notifyListeners();
  }

  String get userState => _userState;

  set userState(String value) {
    _userState = value;
    notifyListeners();
  }

  String get userZipCode => _userZipCode;

  set userZipCode(String value) {
    _userZipCode = value;
    notifyListeners();
  }

  String get userCountry => _userCountry;

  set userCountry(String value) {
    _userCountry = value;
    notifyListeners();
  }

  String get defaultCountry => _defaultCountry;

  set defaultCountry(String value) {
    _defaultCountry = value;
    notifyListeners();
  }

  String get selected => _selected;

  set selected(String value) {
    _selected = value;
    notifyListeners();
  }
}