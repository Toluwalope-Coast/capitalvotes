import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/nominee_with_category_bloc.dart';
import 'package:capitalvotes/blocs/nominee_without_category_bloc.dart';
import 'package:flutter/material.dart';

class ContestBloc extends ChangeNotifier{
  String _contestID;
  String _creatorUsername = 'ToluwalopeCoast43';
  String _creatorCountry = 'Nigeria';
  String _contestBanner;
  String _contestName;
  String _contestDescription;
  String _startTime;
  String _endTime;
  String _startDate;
  String _endDate;
  bool _isPaidFor = false;
  double _voteRate;
  String _currencyType;
  bool _isCategory = false;
  String _categoryDescription;
  String _nomineeDescription;



//  bool _brand;

  List <NomineeWithOutCategoryBloc> nomineeWithOutCategoryList = [];

  List <CategoryBloc> contestCategoryList = [];


  // Getters

  String get getContestID => _contestID;

//  bool get brand => _brand;

  String get getEndDate => _endDate;

  String get getEndTime => _endTime;

  String get getStartTime => _startTime;

  String get getStartDate => _startDate;

  String get getContestDescription => _contestDescription;

  String get getCategoryDescription => _categoryDescription;

  String get getNomineeDescription => _nomineeDescription;

  String get getContestName => _contestName;

  bool get getIsCategory => _isCategory;

  bool get getIsPaidFor => _isPaidFor;

  double get getVoteRate => _voteRate;

  String get getContestBanner => _contestBanner;

  String get getCreatorCountry => _creatorCountry;

  String get getCreatorUsername => _creatorUsername;

  String get getCurrencyType => _currencyType;


  set setContestID(String value) {
    _creatorUsername = value;
    notifyListeners();
  }

  set setCreatorUsername(String value) {
    _creatorUsername = value;
    notifyListeners();
  }

  set setCreatorCountry(String value) {
    _creatorCountry = value;
    notifyListeners();
  }

  set setContestBanner(String value) {
    _contestBanner = value;
    notifyListeners();
  }

  set setContestName(String value) {
    _contestName = value;
    notifyListeners();
  }

  set setContestDescription(String value) {
    _contestDescription = value;
    notifyListeners();
  }

  set setNomineeDescription(String value) {
    _nomineeDescription = value;
    notifyListeners();
  }

  set setCategoryDescription(String value) {
    _categoryDescription = value;
    notifyListeners();
  }
  set setStartDate(String value) {
    _startDate = value;
    notifyListeners();
  }

  set setEndDate(String value) {
    _endDate = value;
    notifyListeners();
  }


  set setStartTime(String value) {
    _startTime = value;
    notifyListeners();
  }

  set setEndTime(String value) {
    _endTime = value;
    notifyListeners();
  }

  set setIsPaidFor(bool value) {
    _isPaidFor = value;
    notifyListeners();
  }

  set setIsCategory(bool value) {
    _isCategory = value;
    notifyListeners();
  }

//  set brand(bool value) {
//    _brand = value;
//    notifyListeners();
//  }
  set setVoteRate(double value) {
    _voteRate = value;
    notifyListeners();
  }

  set setCurrencyType(String value) {
    _currencyType = value;
    notifyListeners();
  }


  // Special Functions

// Nominee without Category


  addNomineeToContestList(NomineeWithOutCategoryBloc nominee){
    nomineeWithOutCategoryList.add(nominee);
    notifyListeners();
  }

  removeNomineeFromContestList(int index){
    nomineeWithOutCategoryList.removeAt(index);
    notifyListeners();
  }
  updateNomineeFromContestList(int index, NomineeWithOutCategoryBloc nominee){
    nomineeWithOutCategoryList.removeAt(index);
    nomineeWithOutCategoryList.insert(index, nominee);
    notifyListeners();
  }

  deleteTheEntireNomineeFromContestList(){
    nomineeWithOutCategoryList.clear();
    notifyListeners();
  }



// Category


  addCategoryList(CategoryBloc category){
    contestCategoryList.add(category);
    notifyListeners();
  }

  removeCategoryFromContest(CategoryBloc category){
    contestCategoryList.removeAt(contestCategoryList.indexOf(category));
    notifyListeners();
  }
  updateCategoryListFromContest(int index, CategoryBloc category){
    contestCategoryList.removeAt(index);
    contestCategoryList.insert(index, category);
    notifyListeners();
  }

  removeTheEntireCategoryList(){
    contestCategoryList.clear();
    notifyListeners();
  }


// Category Nominee


  addNomineeToContestCategory(int index, NomineeWithCategoryBloc nominee){
    contestCategoryList[index].addNomineeToCategoryList(nominee);
    notifyListeners();
  }

  removeNomineeFromContestCategory(int categoryIndex, int nomineeIndex){
    contestCategoryList[categoryIndex].removeNomineeFromCategoryList(nomineeIndex);
    notifyListeners();
  }
  updateNomineeListFromContestCategory(int categoryIndex, int nomineeIndex, NomineeWithCategoryBloc nominee){
    contestCategoryList[categoryIndex].updateNomineeFromCategoryList(nomineeIndex, nominee);
    notifyListeners();
  }

  removeTheEntireNomineeFromContestCategory(){
    contestCategoryList.clear();
    notifyListeners();
  }

//  int totalCountCategory() => contestCategoryList.length;
//
//  int totalCountContestantWithOutCategory() => contestantWithOutCategoryList.length;

//// Json deserialize  mapping methods
//
//  Contest.map(dynamic obj) {
//    this._creatorUsername = obj['Creator Username'];
//    this._contestBanner = obj['Contest Banner'];
//    this._creatorCountry = obj['Creator Country'];
//    this._contestName = obj['Contest Name'];
//    this._contestDescription = obj['Contest Description'];
//    this._startDate = obj['Contest Start Date'];
//    this._endDate = obj['Contest End Date'];
//    this._brand = obj['Brand'];
//  }


//// from map
//  Contest.fromMap(Map<String, dynamic> map) {
//    this._creatorUsername = map['Creator Username'];
//    this._contestBanner = map['Contest Banner'];
//    this._creatorCountry = map['Creator Country'];
//    this._contestName = map['Contest Name'];
//    this._contestDescription = map['Contest Description'];
//    this._startDate = map['Contest Start Date'];
//    this._endDate = map['Contest End Date'];
//    this._brand = map['Brand'];
//  }

  // To map
//
//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map['Brand'] = _brand;
//    map['Contest End Date'] = _endDate;
//    map['Contest Start Date'] = _startDate;
//    map['Contest Description'] = _contestDescription;
//    map['Contest Name'] = _contestName;
//    map['Creator Country'] = _creatorCountry;
//    map['Contest Banner'] = _contestBanner;
//    map['Creator Username'] = _creatorUsername;
//
//    return map;
//  }

}
