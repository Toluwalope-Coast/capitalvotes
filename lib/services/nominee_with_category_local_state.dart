import 'package:flutter/material.dart';

class LocalNomineeWithCategoryBlocState extends ChangeNotifier{

  String _nomineeName;
  String _nomineeDescription;
  String _nomineeBanner;
  int _nomineeCategoryId;
  String _nomineeCategoryName;

// Getters

  String get getNomineeName => _nomineeName;

  String get getNomineeDescription => _nomineeDescription;

  String get getNomineeBanner => _nomineeBanner;

  int get getNomineeCategoryId => _nomineeCategoryId;

  String get getNomineeCategoryName => _nomineeCategoryName;


  //Setters

  set setNomineeName(String value) {
    _nomineeName = value;
    notifyListeners();
  }

  set setNomineeDescription(String value) {
    _nomineeDescription = value;
    notifyListeners();
  }

  set setNomineeBanner(String value) {
    _nomineeBanner = value;
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