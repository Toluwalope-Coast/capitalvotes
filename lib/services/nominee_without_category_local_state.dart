import 'package:flutter/material.dart';

class LocalNomineeWithoutCategoryBlocState extends ChangeNotifier{

  String _nomineeName;
  String _nomineeDescription;
  String _nomineeBanner;

// Getters

  String get getNomineeName => _nomineeName;

  String get getNomineeDescription => _nomineeDescription;

  String get getNomineeBanner => _nomineeBanner;


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


}