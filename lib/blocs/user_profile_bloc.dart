
import 'package:flutter/material.dart';

class UserProfileBloc extends ChangeNotifier{
  String _uID;
  String _fullName;
  String _userName;
  String _gender;
  String _email;
  String _website;
  String _phoneNo;
  String _userImage;
  String _country;
  String _bio;


  // Getters


  String get getUid => _uID;

  String get getFullName => _fullName;

  String get getUserName => _userName;

  String get getGender => _gender;

  String get getEmail => _email;

  String get getWebsite => _website;

  String get getPhoneNo => _phoneNo;

  String get getUserImage => _userImage;

  String get getCountry => _country;

  String get getBio => _bio;



  // Setters

  set setUid(String value) {
    _uID = value;
    notifyListeners();
  }

  set setFullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  set setUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  set setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  set setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  set setWebsite(String value) {
    _website = value;
    notifyListeners();
  }

  set setPhoneNo(String value) {
    _phoneNo = value;
    notifyListeners();
  }

  set setUserImage(String value) {
    _userImage = value;
    notifyListeners();
  }

  set setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  set setBio(String value) {
    _bio = value;
  }


// Constructors


}