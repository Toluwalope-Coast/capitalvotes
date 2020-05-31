import 'dart:io';

import 'package:capitalvotes/pages/creator_view_contest.dart';
import 'package:capitalvotes/pages/imagecapture.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/material.dart';



class AddNomineeWithCategory extends StatefulWidget {

  @override
  _AddNomineeWithCategoryState createState() => _AddNomineeWithCategoryState();
}

class _AddNomineeWithCategoryState extends State<AddNomineeWithCategory> {
//  Future saveContestToPreference({
//    String contestNomineeName,
//    String contestNomineeBio,
//    String contestNomineeState,
//    String contestNomineeCountry,
//    String contestNomineeContestantNo,
//  }) async {
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    preferences.setString('Contest Nominee Full Name', contestNomineeName);
//    preferences.setString('Contest Nominee Bio', contestNomineeBio);
//    preferences.setString('Contest Nonminee State', contestNomineeState);
//    preferences.setString('Contest Nominee Country', contestNomineeCountry);
//    preferences.setString(
//        'Contest Nominee Contestant No', contestNomineeContestantNo);
//  }
//
//  final _formKey = GlobalKey<FormState>();
//  TextEditingController _contestNomineeCountryController = TextEditingController();
//  TextEditingController _contestNomineeNameController = TextEditingController();
//  TextEditingController _contestNomineeBioController = TextEditingController();
//  TextEditingController _contestNomineeStateController =
//  TextEditingController();
//  TextEditingController _contestNomineeContestantNoController =
//  TextEditingController();
//
//  // form text input
//
//  Widget _inputFormFieldText(text1, text2, type, controlValue) {
//    return TextFormField(
//      keyboardType: type,
//      controller: controlValue,
//      decoration: InputDecoration(
//          enabledBorder:
//          OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
//          focusedBorder:
//          OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
//          labelText: text1,
//          fontSize: 12.0, fontFamily: 'poppins', color: Color(0X553D2960)),
//          labelStyle: TextStyle(
//          filled: true,
//          fillColor: Colors.white),
//      validator: (val) => val.isEmpty ? text2 : null,
//      onChanged: (val) => setState(() => text1 = val),
//    );
//  }
  @override
  Widget build(BuildContext context) {
//    final screenHeight = MediaQuery.of(context).size.height;
//    // Media Query Responsiveness
//
//    final screenWidth = MediaQuery.of(context).size.width;
//
//
//    LocalCategoryBlocState localCategoryBlocState = Provider.of<LocalCategoryBlocState>(context);


    return ListView(children: <Widget>[
//      InkWell(
//        onTap: () {
//          pushGoTo(context, ImageCapture(location: 'add_Nominee_category'));
//        },
//        child: Container(
//          height: screenHeight * 0.30,
//          width: screenWidth,
//          color: Color(0Xee3D2960),
//          child: Stack(
//            alignment: Alignment.center,
//            fit: StackFit.expand,
//            children: <Widget>[
//              Positioned(
//                  bottom: screenHeight * 0.09,
//                  left: screenWidth * 0.35,
//                  child: Icon(
//                    Icons.photo_library,
//                    size: screenWidth * 0.20,
//                    color: Color(0X99FFFFFF),
//                  )),
//              Positioned.fill(
//                  child: widget.contestNomineeWithCategoryImage != null
//                      ? Image.file(
//                    widget.contestNomineeWithCategoryImage,
//                    fit: BoxFit.cover,
//                    height: screenHeight * 0.25,
//                    width: screenWidth,
//                  )
//                      : Container(color: Colors.transparent)),
////                                  : Text('')),
//              Positioned(
//                  bottom: screenHeight * 0.003,
//                  right: 4.0,
//                  child: FlatButton.icon(
//                      padding: EdgeInsets.all(5.0),
//                      color: Color(0x65E5306C),
//                      onPressed: () {},
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(40)),
//                      icon: Icon(Icons.photo_library,
//                          color: Colors.white, size: 16.0),
//                      label: Text('Add Cover Picture',
//                          style: TextStyle(
//                              fontSize: 9.0,
//                              fontFamily: 'poppins',
//                              color: Colors.white))))
//            ],
//          ),
//        ),
//      ),
//      Form(
//          key: _formKey,
//          child: Padding(
//            padding:
//            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
//            child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    'Full Name',
//                    style: Theme.of(context).textTheme.bodyText2,
//                  ),
//                  SizedBox(height: 4.0),
//                  Container(
//                    height: screenHeight / 15,
//                    child: _inputFormFieldText('Full Name', 'invalid full name',
//                        TextInputType.text, _contestNomineeNameController),
//                  ),
//                  SizedBox(height: 10.0),
//                  Row(
//                    children: <Widget>[
//                      Text(
//                        'Bio',
//                        style: Theme.of(context).textTheme.bodyText2,
//                      ),
//                      Text(
//                        '(max of 50 words)',
//                        style: TextStyle(
//                          fontSize: 12.0,
//                          fontFamily: 'poppins',
//                          color: Color(0X553D2960),
//                        ),
//                      )
//                    ],
//                  ),
//                  SizedBox(height: 4.0),
//                  Container(
//                    height: screenHeight * 0.06,
//                    child: _inputFormFieldText('Contest Bio', 'invalid Bio',
//                        TextInputType.multiline, _contestNomineeBioController),
//                  ),
//                  SizedBox(height: 10.0),
//                  Container(
//                      height: screenHeight * 0.108,
//                      child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Container(
//                                  width: screenWidth * 0.30,
//                                  child: Text(
//                                    'State',
//                                    style:
//                                    Theme.of(context).textTheme.bodyText2,
//                                  ),
//                                ),
//                                Container(
//                                  height: screenHeight * 0.06,
//                                  width: screenWidth * 0.40,
//                                  child: _inputFormFieldText(
//                                      'State',
//                                      'invalid State',
//                                      TextInputType.multiline,
//                                      _contestNomineeStateController),
//                                ),
//                              ],
//                            ),
//                            Column(
//                              children: <Widget>[
//                                Container(
//                                  width: screenWidth * 0.30,
//                                  child: Text(
//                                    'Country',
//                                    style:
//                                    Theme.of(context).textTheme.bodyText2,
//                                  ),
//                                ),
//                                Container(
//                                  height: screenHeight * 0.06,
//                                  width: screenWidth * 0.40,
//                                  child: _inputFormFieldText(
//                                      'Country',
//                                      'Invalid Country',
//                                      TextInputType.phone,
//                                      _contestNomineeCountryController),
//                                ),
//                              ],
//                            )
//                          ])),
//                  SizedBox(height: 10.0),
//                  Row(children: <Widget>[
//                    Text(
//                      'Contestant Number',
//                      style: Theme.of(context).textTheme.bodyText2,
//                    ),
//                    Container(
//                      height: screenHeight * 0.06,
//                      width: screenWidth * 0.20,
//                      child: _inputFormFieldText(
//                          '000',
//                          'invalid contestant No',
//                          TextInputType.text,
//                          _contestNomineeContestantNoController),
//                    ),
//                  ]),
//                  SizedBox(height: 10.0),
//                  Container(
//                    width: screenWidth,
//                    child: RaisedButton(
//                        onPressed: () {
//                          // the saving the data to share preferences
//                          saveContestToPreference(
//                              contestNomineeName:
//                              _contestNomineeNameController.text,
//                              contestNomineeBio:
//                              _contestNomineeBioController.text,
//                              contestNomineeState:
//                              _contestNomineeStateController.text,
//                              contestNomineeCountry: _contestNomineeCountryController.text,
//                              contestNomineeContestantNo:
//                              _contestNomineeContestantNoController.text);
//                          pushGoTo(context, CreatorViewContest());
//                        },
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(40)),
//                        child: Text('Done',
//                            style: Theme.of(context).textTheme.button)),
//                  )
//                ]),
//          ))
    ]);
  }
}
