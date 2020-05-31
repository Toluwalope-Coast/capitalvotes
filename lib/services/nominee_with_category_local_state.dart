import 'package:flutter/material.dart';

class LocalNomineeWithCategoryBlocState extends ChangeNotifier{

  String _nomineeName;
  String _nomineeBio;
  String _nomineeImage;
  String _nomineeState;
  String _nomineeCountry;
  String _nomineeNumber;
  int _nomineeCategoryId;
  String _nomineeCategoryName;

// Getters

  String get getNomineeName => _nomineeName;

  String get getNomineeBio => _nomineeBio;

  String get getNomineeImage => _nomineeImage;

  String get getNomineeState => _nomineeState;

  String get getNomineeCountry => _nomineeCountry;

  String get getNomineeNumber => _nomineeNumber;

  int get getNomineeCategoryId => _nomineeCategoryId;

  String get getNomineeCategoryName => _nomineeCategoryName;


  //Setters

  set setNomineeName(String value) {
    _nomineeName = value;
    notifyListeners();
  }

  set setNomineeBio(String value) {
    _nomineeBio = value;
    notifyListeners();
  }

  set setNomineeImage(String value) {
    _nomineeImage = value;
    notifyListeners();
  }

  set setNomineeState(String value) {
    _nomineeState = value;
    notifyListeners();
  }

  set setNomineeCountry(String value) {
    _nomineeCountry = value;
    notifyListeners();
  }

  set setNomineeNumber(String value) {
    _nomineeNumber = value;
    notifyListeners();
  }

  set setNomineeCategoryId(int value) {
    _nomineeCategoryId = value;
    notifyListeners();
  }

  set setNomineeCategoryName(String value) {
    _nomineeCategoryName = value;
    notifyListeners();
  }

}