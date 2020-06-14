//import 'package:flutter/material.dart';
//import 'package:capitalvotes/blocs/social_handlesBloc.dart';
//
//class SocialMediaHandleBloc extends ChangeNotifier {
//
//  List<SocialMediaHandle> nomineeSocialMediaHandle = [];
//
//
//  addNomineeSocialHandleList(SocialMediaHandle socialMediaHandle){
//    nomineeSocialMediaHandle.add(socialMediaHandle);
//    notifyListeners();
//  }
//
//  removeSocialMediaFromNomineeSocialHandleList(int index){
//    nomineeSocialMediaHandle.removeAt(index);
//    notifyListeners();
//  }
//  updateSocialMediaFromNomineeSocialHandleList(int index, SocialMediaHandle socialMediaHandle){
//    nomineeSocialMediaHandle.removeAt(index);
//    nomineeSocialMediaHandle.insert(index, socialMediaHandle);
//    notifyListeners();
//  }
//
//  removeTheEntireNomineeSocialHandleList(){
//    nomineeSocialMediaHandle.clear();
//    notifyListeners();
//  }
//
//}