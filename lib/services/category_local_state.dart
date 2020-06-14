import 'package:flutter/material.dart';

class LocalCategoryBlocState extends ChangeNotifier{

  int _categoryIndex;
  String _categoryName;
  String _categoryDescription;
  String _categoryBanner;

// Getters

  int get getCategoryIndex => _categoryIndex;

  String get getCategoryName => _categoryName;

  String get getCategoryDescription => _categoryDescription;

  String get getCategoryBanner => _categoryBanner;


  //Setters

  set setCategoryIndex(int value) {
    _categoryIndex = value;
    notifyListeners();
  }

  set setCategoryName(String value) {
    _categoryName = value;
    notifyListeners();
  }

  set setCategoryDescription(String value) {
    _categoryDescription = value;
    notifyListeners();
  }

  set setCategoryBanner(String value) {
    _categoryBanner = value;
    notifyListeners();
  }

}
