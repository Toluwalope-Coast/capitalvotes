import 'package:flutter/material.dart';
import 'package:capitalvotes/blocs/social_handlesBloc.dart';

class NomineeLocalBlocState extends ChangeNotifier{

  String _nomineeName;
  String _nomineeProfession;
  String _nomineeImage;
  String _nomineeGender;
  String _nomineeState;
  String _nomineeCountry;
  String _nomineeNumber;
  String _nomineeContestName;
  String _nomineeContestBanner;
  String _nomineeContestEndDate;
  bool _isNomineeContestCategory;
  int _nomineeContestCategoryIndex;
  String _nomineeContestCategoryName;
  String _nomineeContestVoteCurrency;
  double _nomineeContestVoteCost;
  int _nomineeContestVoteScore;
  String _nomineeContestVoteScorePercentage;
  String _nomineeContestResult;

  List nomineeSocialMediaHandle = [];


// Getters

  String get getNomineeName => _nomineeName;

  String get getNomineeProfession => _nomineeProfession;

  String get getNomineeImage => _nomineeImage;

  String get getNomineeState => _nomineeState;

  String get getNomineeGender => _nomineeGender;

  String get getNomineeCountry => _nomineeCountry;

  String get getNomineeNumber => _nomineeNumber;

  String get getNomineeContestName => _nomineeContestName;

  String get getNomineeContestBanner => _nomineeContestBanner;

  String get getNomineeContestEndDate => _nomineeContestEndDate;

  bool get getIsNomineeContestCategory => _isNomineeContestCategory;

  String get getNomineeContestCategoryName => _nomineeContestCategoryName;

  int get getNomineeContestCategoryIndex => _nomineeContestCategoryIndex;

  String get getNomineeContestVoteCurrency => _nomineeContestVoteCurrency;

  double get getNomineeContestVoteCost => _nomineeContestVoteCost;

  int get getNomineeContestVoteScore => _nomineeContestVoteScore;

  String get getNomineeContestVoteScorePercentage => _nomineeContestVoteScorePercentage;

  String get getNomineeContestResult => _nomineeContestResult;


  //Setters

  set setNomineeName(String value) {
    _nomineeName = value;
    notifyListeners();
  }

  set setNomineeProfession(String value) {
    _nomineeProfession = value;
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

  set setNomineeGender(String value) {
    _nomineeGender = value;
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

  set setNomineeContestName(String value) {
    _nomineeContestName = value;
    notifyListeners();
  }

  set setNomineeContestBanner(String value) {
    _nomineeContestBanner = value;
    notifyListeners();
  }

  set setNomineeContestEndDate(String value) {
    _nomineeContestEndDate = value;
    notifyListeners();
  }

  set setNomineeCategoryName(String value) {
    _nomineeContestCategoryName = value;
    notifyListeners();
  }

  set setNomineeCategoryIndex(int value) {
    _nomineeContestCategoryIndex = value;
    notifyListeners();
  }

  set setNomineeContestVoteCost(double value) {
    _nomineeContestVoteCost = value;
    notifyListeners();
  }

  set setNomineeContestVoteCurrency(String value) {
    _nomineeContestVoteCurrency = value;
    notifyListeners();
  }

  set setNomineeContestVoteScore(int value) {
    _nomineeContestVoteScore = value;
    notifyListeners();
  }

  set setNomineeContestVoteScorePercentage(String value) {
    _nomineeContestVoteScorePercentage = value;
    notifyListeners();
  }

  set setNomineeContestResult(String value) {
    _nomineeContestResult = value;
    notifyListeners();
  }


  addNomineeSocialHandleList(socialMediaHandle){
    nomineeSocialMediaHandle.add(socialMediaHandle);
    notifyListeners();
  }

  removeSocialMediaFromNomineeSocialHandleList(int index){
    nomineeSocialMediaHandle.removeAt(index);
    notifyListeners();
  }
//  updateSocialMediaFromNomineeSocialHandleList(int index, socialMediaHandle){
//    nomineeSocialMediaHandle.removeAt(index);
//    nomineeSocialMediaHandle.insert(index, socialMediaHandle);
//    notifyListeners();
//  }

  removeTheEntireNomineeSocialHandleList(){
    nomineeSocialMediaHandle.clear();
    notifyListeners();
  }

}
