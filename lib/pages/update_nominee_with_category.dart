import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/nominee_with_category_entry_bloc.dart';
import 'package:capitalvotes/services/nominee_update_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UpdateNomineeWithCategory extends StatefulWidget {
  @override
  _UpdateNomineeWithCategoryState createState() =>
      _UpdateNomineeWithCategoryState();
}

class _UpdateNomineeWithCategoryState
    extends State<UpdateNomineeWithCategory> {
  final _formKey = GlobalKey<FormState>();


  Country _selected;
  int _categoryIndex;
  String _categoryName;

  _save(contestBloc, localUpdateNomineeWithCategoryBlocState) {
    // instance of the category object
    NomineeWithCategoryBloc nomineeWithCategoryBloc =
    new NomineeWithCategoryBloc();

    nomineeWithCategoryBloc.nomineeName =
        localUpdateNomineeWithCategoryBlocState.getNomineeName;
    nomineeWithCategoryBloc.nomineeProfession =
        localUpdateNomineeWithCategoryBlocState.getNomineeProfession;
    nomineeWithCategoryBloc.nomineeImage =
        localUpdateNomineeWithCategoryBlocState.getNomineeImage;
    nomineeWithCategoryBloc.nomineeState =
        localUpdateNomineeWithCategoryBlocState.getNomineeState;
    nomineeWithCategoryBloc.nomineeCountry =
        localUpdateNomineeWithCategoryBlocState.getNomineeCountry;
    nomineeWithCategoryBloc.nomineeNumber =
        localUpdateNomineeWithCategoryBlocState.getNomineeNumber;
    nomineeWithCategoryBloc.nomineeContestName = contestBloc.getContestName;
    nomineeWithCategoryBloc.nomineeContestBanner = contestBloc.getContestBanner;
    nomineeWithCategoryBloc.nomineeContestEndDate = contestBloc.getEndTime;
    nomineeWithCategoryBloc.isNomineeContestCategory = contestBloc._isCategory;
    nomineeWithCategoryBloc.nomineeContestCategoryIndex = _categoryIndex;
    nomineeWithCategoryBloc.nomineeContestCategoryName =
        localUpdateNomineeWithCategoryBlocState.getNomineeCategoryName;
    nomineeWithCategoryBloc.isNomineeContestCategory = contestBloc._isCategory;
    nomineeWithCategoryBloc.nomineeContestVoteCurrency = contestBloc._currencyType;
    nomineeWithCategoryBloc.nomineeContestVoteCost = contestBloc._voteRate;


    print('The Nominee Name is: ${nomineeWithCategoryBloc.nomineeName}');
    print('The Nominee Profession is: ${nomineeWithCategoryBloc.nomineeProfession}');
    print(
        'The Nominee Image string is: ${nomineeWithCategoryBloc.nomineeImage}');
    print(
        'The Nominee State string is: ${nomineeWithCategoryBloc.nomineeState}');
    print(
        'The Nominee Country string is: ${nomineeWithCategoryBloc.nomineeCountry}');
    print(
        'The Nominee Number is: ${nomineeWithCategoryBloc.nomineeNumber}');
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

      contestBloc.updateNomineeFromContestList(
          localUpdateNomineeWithCategoryBlocState.getNomineeIndex,
          nomineeWithCategoryBloc);

      localUpdateNomineeWithCategoryBlocState.setNomineeName = null;

      localUpdateNomineeWithCategoryBlocState.setNomineeBio = null;

      localUpdateNomineeWithCategoryBlocState.setNomineeImage = null;

      popGoTo(context, '/CreatorContestView');
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Please add nominee image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    LocalUpdateNomineeWithCategoryBlocState localUpdateNomineeWithCategoryBlocState =
    Provider.of<LocalUpdateNomineeWithCategoryBlocState>(context);

    return Scaffold(
      appBar: topAppBar2('Update Nominee', context),
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        InkWell(
          onTap: () {
            navigateToImageCapture(context, 'update_Nominee_with_category');
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
                    child: Image.memory(
                      stringToImageFile(localUpdateNomineeWithCategoryBlocState
                          .getNomineeImage),
                      fit: BoxFit.cover,
                    )),
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
                            localUpdateNomineeWithCategoryBlocState.getNomineeImage ==
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
                            initialValue: localUpdateNomineeWithCategoryBlocState
                                .getNomineeName ??
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
    localUpdateNomineeWithCategoryBlocState.setNomineeName =
                                  value;
                            })),
                    SizedBox(height: 10.0),
                    Text(
                      'Nominee Profession',
                      textAlign: TextAlign.start,
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
                            initialValue: localUpdateNomineeWithCategoryBlocState
                                .getNomineeProfession ??
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
                                hintText: 'Nominee Profession',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'poppins',
                                    color: Color(0X553D2960),
                                    fontStyle: FontStyle.italic,
                                    textBaseline: TextBaseline.alphabetic),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) {
                              localUpdateNomineeWithCategoryBlocState.setNomineeProfession =
                                  value;
                            })),
                    SizedBox(height: screenHeight * 0.03),
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
                          localUpdateNomineeWithCategoryBlocState.setNomineeCountry =
                              country.name;
                          print(
                              'This is the country ${localUpdateNomineeWithCategoryBlocState.getNomineeCountry}.');
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
                    Text(
                      'State',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                    Container(
                        height: screenHeight * 0.06,
                        padding: EdgeInsets.all(0.0),
                        child: TextFormField(
                            initialValue: localUpdateNomineeWithCategoryBlocState
                                .getNomineeState,
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.0),
                            autovalidate: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0X553D2960))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0X553D2960))),
                                hintText: 'State',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'poppins',
                                    color: Color(0X553D2960),
                                    fontStyle: FontStyle.italic,
                                    textBaseline: TextBaseline.alphabetic),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) =>
                            localUpdateNomineeWithCategoryBlocState
                                .setNomineeState = value)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Nominee Number',
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
                                initialValue: localUpdateNomineeWithCategoryBlocState
                                    .getNomineeNumber,
                                textAlignVertical: TextAlignVertical.bottom,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16.0),
                                autovalidate: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0X553D2960))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0X553D2960))),
                                    hintText: 'Nominee Number',
                                    hintStyle: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'poppins',
                                        color: Color(0X553D2960),
                                        fontStyle: FontStyle.italic,
                                        textBaseline: TextBaseline.alphabetic),
                                    filled: true,
                                    fillColor: Colors.white),
                                onChanged: (value) =>
                                localUpdateNomineeWithCategoryBlocState
                                    .setNomineeNumber = value)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Category Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                      width: screenWidth,
                      height: screenHeight * 0.06,
                      constraints: BoxConstraints.expand(
                          width: screenWidth, height: screenHeight * 0.08),
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
                          hint: Text('Select Category',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,)),
                          items: contestBloc.contestCategoryList
                              .map((CategoryBloc category) =>
                              DropdownMenuItem<CategoryBloc>(
                                  value: category,
                                  child: Text('${category.categoryName}',
                                      style: TextStyle( color: Colors.black,
                                          fontSize: 16.0))))
                              .toList(),
                          onChanged: (CategoryBloc category) {
                            localUpdateNomineeWithCategoryBlocState.setNomineeCategoryName = category.categoryName;

                            localUpdateNomineeWithCategoryBlocState.setNomineeCategoryIndex = contestBloc.contestCategoryList.indexOf(category);
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
                    SizedBox(height: screenHeight * 0.08),
                    Container(
                      width: screenWidth,
                      child: RaisedButton(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.054,
                              bottom: screenWidth * 0.054),
                          color:
                          localUpdateNomineeWithCategoryBlocState
                              .getNomineeName !=
                              null &&
                              localUpdateNomineeWithCategoryBlocState.getNomineeProfession !=
                                  null &&
                              localUpdateNomineeWithCategoryBlocState
                                  .getNomineeImage !=
                                  null &&
                              localUpdateNomineeWithCategoryBlocState
                                  .getNomineeCountry !=
                                  null &&
                              localUpdateNomineeWithCategoryBlocState
                                  .getNomineeState !=
                                  null
                              ? Color(0xffE5306C)
                              : Color(0x65E5306C),
                          onPressed: () {
                            localUpdateNomineeWithCategoryBlocState.getNomineeName !=
                                null &&
                                localUpdateNomineeWithCategoryBlocState
                                    .getNomineeProfession !=
                                    null &&
                                localUpdateNomineeWithCategoryBlocState.getNomineeImage !=
                                    null &&
                                localUpdateNomineeWithCategoryBlocState
                                    .getNomineeCountry !=
                                    null &&
                                localUpdateNomineeWithCategoryBlocState
                                    .getNomineeState !=
                                    null
                                ? _save(contestBloc,
                                localUpdateNomineeWithCategoryBlocState)
                                : print('Not enabled');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text('Add',
                              style: Theme.of(context).textTheme.button)),
                    )
                  ]),
            ))
      ])
    );
  }
}
