import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/nominee_with_category_entry_bloc.dart';
import 'package:capitalvotes/services/add_social_media_form.dart';
import 'package:capitalvotes/services/social_media_bloc_state.dart';
import 'package:capitalvotes/services/nominee_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:provider/provider.dart';

class AddNomineeWithCategory extends StatefulWidget {
  @override
  _AddNomineeWithCategoryState createState() => _AddNomineeWithCategoryState();
}

class _AddNomineeWithCategoryState extends State<AddNomineeWithCategory> {
  final _formKey = GlobalKey<FormState>();

  Country _selected;
  int _categoryIndex;
  String _categoryName;

  final List<String> genders = [
    'Female',
    'Male'
  ]; // Strings for the Gender dropdown values

  _save(contestBloc, localNomineeWithCategoryBlocState) {
    // instance of the category object
    NomineeWithCategoryBloc nomineeWithCategoryBloc =
        new NomineeWithCategoryBloc();

    nomineeWithCategoryBloc.nomineeName =
        localNomineeWithCategoryBlocState.getNomineeName;
    nomineeWithCategoryBloc.nomineeProfession =
        localNomineeWithCategoryBlocState.getNomineeProfession;
    nomineeWithCategoryBloc.nomineeImage =
        localNomineeWithCategoryBlocState.getNomineeImage;
    nomineeWithCategoryBloc.nomineeState =
        localNomineeWithCategoryBlocState.getNomineeState;
    nomineeWithCategoryBloc.nomineeCountry =
        localNomineeWithCategoryBlocState.getNomineeCountry;
    nomineeWithCategoryBloc.nomineeNumber =
        localNomineeWithCategoryBlocState.getNomineeNumber;
    nomineeWithCategoryBloc.nomineeContestName = contestBloc.getContestName;
    nomineeWithCategoryBloc.nomineeContestBanner = contestBloc.getContestBanner;
    nomineeWithCategoryBloc.nomineeContestEndDate = contestBloc.getEndTime;
    nomineeWithCategoryBloc.isNomineeContestCategory = contestBloc._isCategory;
    nomineeWithCategoryBloc.nomineeContestCategoryIndex = _categoryIndex;
    nomineeWithCategoryBloc.nomineeContestCategoryName =
        localNomineeWithCategoryBlocState.getNomineeCategoryName;
    nomineeWithCategoryBloc.isNomineeContestCategory = contestBloc._isCategory;
    nomineeWithCategoryBloc.nomineeContestVoteCurrency =
        contestBloc._currencyType;
    nomineeWithCategoryBloc.nomineeContestVoteCost = contestBloc._voteRate;
//    nomineeWithCategoryBloc.nomineeSocialMediaHandle = socialMediaHandle;

    print('The Nominee Name is: ${nomineeWithCategoryBloc.nomineeName}');
    print(
        'The Nominee Profession is: ${nomineeWithCategoryBloc.nomineeProfession}');
    print(
        'The Nominee Image string is: ${nomineeWithCategoryBloc.nomineeImage}');
    print(
        'The Nominee State string is: ${nomineeWithCategoryBloc.nomineeState}');
    print(
        'The Nominee Country string is: ${nomineeWithCategoryBloc.nomineeCountry}');
    print('The Nominee Number is: ${nomineeWithCategoryBloc.nomineeNumber}');
    print(
        'The Nominee Contest Name is: ${nomineeWithCategoryBloc.nomineeContestName}');
    print(
        'The Nominee Contest Banner string is: ${nomineeWithCategoryBloc.nomineeContestBanner}');
    print(
        'The Nominee Contest End Date is: ${nomineeWithCategoryBloc.nomineeContestEndDate}');
    print(
        'is Nominee Contest a category is: ${nomineeWithCategoryBloc.isNomineeContestCategory}');
    print(
        'The Nominee Category is: ${nomineeWithCategoryBloc.nomineeContestCategoryName}');
    print(
        'The Nominee Category Index is: ${nomineeWithCategoryBloc.nomineeContestCategoryIndex}');
    print(
        'The Nominee Contest Vote Currency is: ${nomineeWithCategoryBloc.nomineeContestVoteCurrency}');
    print(
        'The Nominee Contest Vote Cost is: ${nomineeWithCategoryBloc.nomineeContestVoteCost}');

    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      contestBloc.addNomineeToContestCategory(
          _categoryIndex, nomineeWithCategoryBloc);

      localNomineeWithCategoryBlocState.setNomineeName = null;

      localNomineeWithCategoryBlocState.setNomineeProfession = null;

      localNomineeWithCategoryBlocState.setNomineeImage = null;

      localNomineeWithCategoryBlocState.setNomineeState = null;

      localNomineeWithCategoryBlocState.setNomineeCountry = null;

      localNomineeWithCategoryBlocState.setNomineeNumber = null;

      localNomineeWithCategoryBlocState.setNomineeCategoryName = null;

      localNomineeWithCategoryBlocState.setNomineeCategoryIndex = null;

      popGoTo(context, '/CreatorContestView');
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Please add nominee image')));
    }
  }

  int _socialMediaCounter = 0;

  _addSocialMediaHandle(nomineeLocalBlocState) {
    if (nomineeLocalBlocState.nomineeSocialMediaHandle.length < 4) {

      print('Add Social Media $_socialMediaCounter');
      _socialMediaCounter++;
      print('Add Social Media $_socialMediaCounter');
      nomineeLocalBlocState.nomineeSocialMediaHandle.add(AddSocialMediaForm());
      print('Add Social Media total no ${nomineeLocalBlocState.nomineeSocialMediaHandle[--_socialMediaCounter]}');
      print('Add Social Media user link ${nomineeLocalBlocState.nomineeSocialMediaHandle.length}');
    }
  }

  _showSocialMediaHandle(nomineeLocalBlocState) {
    nomineeLocalBlocState.nomineeSocialMediaHandle.forEach((socialHandle) {
      print(
          'This is the values in social media handle list ${socialHandle.socialMediaNetwork} and  ${socialHandle.socialMediaLink}');
    });
  }

//  List<AddSocialMediaForm> _socialMediaHandleForm = [];

//  List<AddSocialMediaForm> _socialMediaForms = [];





  @override
  Widget build(BuildContext context) {

    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;


    _deleteSocialHandle(index, nomineeLocalBlocState) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                width: screenWidth,
                alignment: Alignment.bottomLeft,
                color: Colors.white70,
                constraints: BoxConstraints(maxHeight: screenHeight * 0.1, maxWidth: screenWidth),
                child: FlatButton(
                  splashColor: Color(0xffE5306C),
                  onPressed: () {
//                    (index);
                    nomineeLocalBlocState.removeSocialMediaFromNomineeSocialHandleList(index);
                    print('The Index Value to be deleted is : $index');
                    popGoTo(context, '/AddNomineeWithCategory');
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'poppins',
                        color: Color(0xffE5306C)),
                  ),
                ),
              ),
            );
          });
    }


    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    NomineeLocalBlocState nomineeLocalBlocState =
        Provider.of<NomineeLocalBlocState>(context);

//    SocialMediaHandleBloc socialMediaHandleBloc =
//        Provider.of<SocialMediaHandleBloc>(context);

    return Scaffold(
      appBar: topAppBar2('Add Nominee', context),
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        InkWell(
          onTap: () {
            navigateToImageCapture(context, 'add_Nominee_with_category');
          },
          child: Container(
            height: screenHeight * 0.30,
            width: screenWidth,
            color: Color(0Xee3D2960),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                    bottom: screenHeight * 0.09,
                    left: screenWidth * 0.35,
                    child: Icon(
                      Icons.photo_library,
                      size: screenWidth * 0.20,
                      color: Color(0X99FFFFFF),
                    )),
                Positioned.fill(
                    child: nomineeLocalBlocState.getNomineeImage !=
                            null
                        ? Image.memory(
                            stringToImageFile(nomineeLocalBlocState.getNomineeImage),
                            fit: BoxFit.cover,
                          )
                        : Container(color: Colors.transparent)),
                Positioned(
                    bottom: screenHeight * 0.003,
                    right: 4.0,
                    child: FlatButton.icon(
                        padding: EdgeInsets.all(5.0),
                        color: Color(0x65E5306C),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        icon: Icon(Icons.photo_library,
                            color: Colors.white, size: 16.0),
                        label: Text(
                            nomineeLocalBlocState.getNomineeImage ==
                                    null
                                ? 'Add Cover Picture'
                                : 'Edit Cover Image',
                            style: TextStyle(
                                fontSize: 9.0,
                                fontFamily: 'poppins',
                                color: Colors.white))))
              ],
            ),
          ),
        ),
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 50.0, left: 16.0, right: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nominee Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                    Container(
                        height: screenHeight * 0.06,
                        padding: EdgeInsets.all(0.0),
                        child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16.0),
                            initialValue: nomineeLocalBlocState.getNomineeName ??
                                '',
                            autovalidate: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0X553D2960))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0X553D2960))),
                                hintText: 'Nominee Name',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'poppins',
                                    color: Color(0X553D2960),
                                    fontStyle: FontStyle.italic,
                                    textBaseline: TextBaseline.alphabetic),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) {
                              nomineeLocalBlocState.setNomineeName =
                                  value;
                            })),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: screenWidth * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Profession',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                              Container(
                                  width: screenWidth * 0.4,
                                  height: screenHeight * 0.06,
                                  padding: EdgeInsets.all(0.0),
                                  child: TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16.0),
                                      initialValue:
                                      nomineeLocalBlocState.getNomineeProfession ??
                                              '',
                                      autovalidate: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          hintText: 'Nominee Profession',
                                          hintStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'poppins',
                                              color: Color(0X553D2960),
                                              fontStyle: FontStyle.italic,
                                              textBaseline:
                                                  TextBaseline.alphabetic),
                                          filled: true,
                                          fillColor: Colors.white),
                                      onChanged: (value) {
                                        nomineeLocalBlocState.setNomineeProfession = value;
                                      })),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Gender',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: screenHeight * 0.06,
//                            padding:  EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border:
                                          Border.all(color: Color(0X553D2960)),
                                      color: Colors.white),
                                  constraints: BoxConstraints(
                                      minWidth: screenWidth * 0.35,
                                      minHeight: screenHeight * 0.06),
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 8.0,
                                              bottom: 10.0,
                                              top: 0.0),
                                          border: InputBorder.none),
                                      value: genders[0],
                                      items: genders
                                          .map((gender) => DropdownMenuItem(
                                              value: gender,
                                              child: Text(gender,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0))))
                                          .toList(),
                                      onChanged: (String genderSelected) =>
                                      nomineeLocalBlocState.setNomineeGender =
                                              genderSelected)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: screenWidth * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'State',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                              Container(
                                  height: screenHeight * 0.06,
                                  child: TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16.0),
                                      initialValue:
                                      nomineeLocalBlocState.getNomineeState ??
                                              '',
                                      autovalidate: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          hintText: 'State',
                                          hintStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'poppins',
                                              color: Color(0X553D2960),
                                              fontStyle: FontStyle.italic,
                                              textBaseline:
                                                  TextBaseline.alphabetic),
                                          filled: true,
                                          fillColor: Colors.white),
                                      onChanged: (value) {
                                        nomineeLocalBlocState.setNomineeState = value;
                                      })),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nominee Number',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                              Container(
                                  height: screenHeight * 0.06,
                                  width: screenWidth * 0.25,
                                  padding: EdgeInsets.all(0.0),
                                  child: TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16.0),
                                      initialValue:
                                      nomineeLocalBlocState.getNomineeNumber ??
                                              '',
                                      autovalidate: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          hintText: '000',
                                          hintStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'poppins',
                                              color: Color(0X553D2960),
                                              fontStyle: FontStyle.italic,
                                              textBaseline:
                                                  TextBaseline.alphabetic),
                                          filled: true,
                                          fillColor: Colors.white),
                                      onChanged: (value) {
                                        nomineeLocalBlocState.setNomineeNumber = value;
                                      })),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Country',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                    Container(
                      height: screenHeight * 0.06,
                      width: screenWidth,
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0X553D2960)),
                          color: Colors.white),
                      child: CountryPicker(
                        dense: false,
                        showFlag: true,
                        //displays flag, true by default
                        showDialingCode: false,
                        //displays dialing code, false by default
                        showName: true,
                        //displays country name, true by default
                        showCurrency: false,
                        //eg. 'British pound'
                        showCurrencyISO: false,
                        //eg. 'GBP'
                        onChanged: (Country country) {
                          nomineeLocalBlocState.setNomineeCountry =
                              country.name;
                          print(
                              'This is the country ${nomineeLocalBlocState.getNomineeCountry}.');
                          setState(() {
                            _selected = country;
                          });
                        },
                        selectedCountry: _selected,
                        nameTextStyle: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'poppins',
                            color: Color(0xff454f63)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: screenWidth * 0.42,
                          child: Text(
                            'Add to Category',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 8.0),
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.08,
                          constraints: BoxConstraints.expand(
                              width: screenWidth * 0.45,
                              height: screenHeight * 0.08),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0X553D2960)),
                              color: Colors.white),
                          child: DropdownButtonFormField<CategoryBloc>(
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                              style: TextStyle(color: Colors.black),
                              hint: Text('Select Categories',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  )),
                              items: contestBloc.contestCategoryList
                                  .map((CategoryBloc category) =>
                                      DropdownMenuItem<CategoryBloc>(
                                          value: category,
                                          child: Text(
                                              '${category.categoryName}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0))))
                                  .toList(),
                              onChanged: (CategoryBloc category) {
                                nomineeLocalBlocState.setNomineeCategoryName =
                                    category.categoryName;

                                nomineeLocalBlocState.setNomineeCategoryIndex =
                                    contestBloc.contestCategoryList
                                        .indexOf(category);
                                setState(() {
                                  _categoryIndex = contestBloc
                                      .contestCategoryList
                                      .indexOf(category);
                                  _categoryName = category.categoryName;
                                });
                                print(
                                    'The category Name selected is: $_categoryName');
                                print(
                                    'The category index selected is: $_categoryIndex');
                              }),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    FlatButton.icon(
                        onPressed: _addSocialMediaHandle(nomineeLocalBlocState),
                        icon: Icon(
                          Icons.add_circle,
                          color: Color(0xffE5306C),
                          size: 20.0,
                        ),
                        label: Text('Add Social Media',
                            style: TextStyle(
                                color: Color(0xffE5306C), fontSize: 14.0))),
                    Container(
                        constraints: BoxConstraints(
                            minWidth: screenWidth,
                            maxHeight: nomineeLocalBlocState.nomineeSocialMediaHandle.length < 2
                                ? screenHeight * 0.15
                                : screenHeight * 0.3),
                        child: ListView.builder(
                            itemCount: nomineeLocalBlocState.nomineeSocialMediaHandle.length,
                            itemBuilder: (_, index) => InkWell(onLongPress: () { _deleteSocialHandle(index, nomineeLocalBlocState); print('longPress activated');},
                                child: nomineeLocalBlocState.nomineeSocialMediaHandle[index]),
                        )),
                    SizedBox(height: 20.0),
//                    RaisedButton(
//                      onPressed: _showSocialMediaHandle(nomineeLocalBlocState),
//                      child: Text('Test'),
//                    ),
                    Container(
                      width: screenWidth,
                      child: RaisedButton(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.054,
                              bottom: screenWidth * 0.054),
                          color: nomineeLocalBlocState.getNomineeName !=
                                      null &&
                              nomineeLocalBlocState.getNomineeProfession !=
                                      null &&
                              nomineeLocalBlocState.getNomineeImage !=
                                      null &&
                              nomineeLocalBlocState.getNomineeCountry !=
                                      null &&
                              nomineeLocalBlocState.getNomineeState !=
                                      null
                              ? Color(0xffE5306C)
                              : Color(0x65E5306C),
                          onPressed: () {
                            nomineeLocalBlocState.getNomineeName !=
                                        null &&
                                nomineeLocalBlocState.getNomineeProfession !=
                                        null &&
                                nomineeLocalBlocState.getNomineeImage !=
                                        null &&
                                nomineeLocalBlocState.getNomineeCountry !=
                                        null &&
                                nomineeLocalBlocState.getNomineeState !=
                                        null
                                ? _save(contestBloc, nomineeLocalBlocState)
                                : print('Not enabled');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text('Add',
                              style: Theme.of(context).textTheme.button)),
                    )
                  ]),
            ))
      ]),
    );
  }
}
