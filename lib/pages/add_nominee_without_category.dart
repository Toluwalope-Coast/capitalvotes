import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/nominee_without_category_bloc.dart';
import 'package:capitalvotes/services/nominee_without_category_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:provider/provider.dart';

class AddNomineeWithOutCategory extends StatefulWidget {
  @override
  _AddNomineeWithOutCategory createState() => _AddNomineeWithOutCategory();
}

class _AddNomineeWithOutCategory extends State<AddNomineeWithOutCategory> {
  final _formKey = GlobalKey<FormState>();

  Country _selected;

  _multiLineNav() => navigateToMultilineText(context, 'nomineeWithoutCategory');

  _save(contestBloc, localNomineeWithoutCategoryBlocState) {
    // instance of the category object
    NomineeWithOutCategoryBloc nomineeWithOutCategoryBloc =
        new NomineeWithOutCategoryBloc();

    nomineeWithOutCategoryBloc.nomineeName =
        localNomineeWithoutCategoryBlocState.getNomineeName;
    nomineeWithOutCategoryBloc.nomineeBio =
        localNomineeWithoutCategoryBlocState.getNomineeBio;
    nomineeWithOutCategoryBloc.nomineeImage =
        localNomineeWithoutCategoryBlocState.getNomineeImage;
    nomineeWithOutCategoryBloc.nomineeCountry =
        localNomineeWithoutCategoryBlocState.getNomineeCountry;
    nomineeWithOutCategoryBloc.nomineeState =
        localNomineeWithoutCategoryBlocState.getNomineeState;
    nomineeWithOutCategoryBloc.nomineeNumber =
        localNomineeWithoutCategoryBlocState.getNomineeNumber;

    print(
        'The Nominee Name is: ${nomineeWithOutCategoryBloc.nomineeName}');
    print('The Nominee Bio is: ${nomineeWithOutCategoryBloc.nomineeBio}');
    print(
        'The Nominee Image string is: ${nomineeWithOutCategoryBloc.nomineeImage}');
    print(
        'The Nominee State string is: ${nomineeWithOutCategoryBloc.nomineeState}');
    print(
        'The Nominee Country string is: ${nomineeWithOutCategoryBloc.nomineeCountry}');
    print(
        'The Nominee Number string is: ${nomineeWithOutCategoryBloc.nomineeNumber}');

    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      contestBloc.addNomineeToContestList(nomineeWithOutCategoryBloc);

      localNomineeWithoutCategoryBlocState.setNomineeName = null;

      localNomineeWithoutCategoryBlocState.setNomineeBio = null;

      localNomineeWithoutCategoryBlocState.setNomineeImage = null;

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

    LocalNomineeWithoutCategoryBlocState localNomineeWithoutCategoryBlocState =
        Provider.of<LocalNomineeWithoutCategoryBlocState>(context);

    return Scaffold(
      appBar: topAppBar2('Add Nominee', context),
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        InkWell(
          onTap: () {
            navigateToImageCapture(context, 'add_Nominee_without_category');
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
                    child:
                        localNomineeWithoutCategoryBlocState.getNomineeImage !=
                                null
                            ? Image.memory(
                                stringToImageFile(
                                    localNomineeWithoutCategoryBlocState
                                        .getNomineeImage),
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
                            localNomineeWithoutCategoryBlocState
                                        .getNomineeImage ==
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
                  top: 5.0, bottom: 20.0, left: 16.0, right: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nominee Name',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Container(
                        height: screenHeight * 0.06,
                        padding: EdgeInsets.all(0.0),
                        child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16.0),
                            initialValue: localNomineeWithoutCategoryBlocState
                                    .getNomineeName ??
                                '',
                            autovalidate: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white30)),
                                hintText: 'Nominee Name',
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'poppins',
                                    color: Color(0X553D2960),
                                    fontStyle: FontStyle.italic),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) {
                              localNomineeWithoutCategoryBlocState
                                  .setNomineeName = value;
                            })),
                    SizedBox(height: 10.0),
                    Text(
                      'Nominee Bio',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    InkWell(
                      onTap: _multiLineNav,
                      child: Container(
                        height: screenHeight * 0.06,
                        width: screenWidth,
                        padding: EdgeInsets.only(
                            top: 4.0, right: 8.0, bottom: 0.0, left: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.white),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            localNomineeWithoutCategoryBlocState
                                    .getNomineeBio ??
                                'Nominee Bio',
                            style: localNomineeWithoutCategoryBlocState
                                        .getNomineeBio ==
                                    null
                                ? TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'poppins',
                                    fontStyle: FontStyle.italic,
                                    color: Color(0X553D2960))
                                : TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'Country',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Container(
                      height: screenHeight * 0.06,
                      width: screenWidth,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 8.0),
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
                          localNomineeWithoutCategoryBlocState.setNomineeCountry = country.name;
                          print(
                              'This is the country ${localNomineeWithoutCategoryBlocState.getNomineeCountry}.');
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
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Container(
                        height: screenHeight * 0.06,
                        padding: EdgeInsets.all(0.0),
                        child: TextFormField(
                            initialValue:
                            localNomineeWithoutCategoryBlocState.getNomineeState == null
                                ? ''
                                : localNomineeWithoutCategoryBlocState.getNomineeState,
                            textAlignVertical:
                            TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.0),
                            autovalidate: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Color(0X553D2960))),
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
                            onChanged: (value) => localNomineeWithoutCategoryBlocState.setNomineeState = value)),
                    SizedBox(height: 10.0),
                    Text(
                      'Nominee Number',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Container(
                        height: screenHeight * 0.06,
                        padding: EdgeInsets.all(0.0),
                        child: TextFormField(
                            initialValue:
                            localNomineeWithoutCategoryBlocState.getNomineeNumber == null
                                ? ''
                                : localNomineeWithoutCategoryBlocState.getNomineeNumber,
                            textAlignVertical:
                            TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.0),
                            autovalidate: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Color(0X553D2960))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0X553D2960))),
                                hintText: 'Nominee Number',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'poppins',
                                    color: Color(0X553D2960),
                                    fontStyle: FontStyle.italic,
                                    textBaseline:
                                    TextBaseline.alphabetic),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) => localNomineeWithoutCategoryBlocState.setNomineeState = value)),
                    SizedBox(height: 10.0),
                    Container(
                      width: screenWidth,
                      child: RaisedButton(
                          color:
                              localNomineeWithoutCategoryBlocState
                                              .getNomineeName !=
                                          null &&
                                      localNomineeWithoutCategoryBlocState
                                              .getNomineeBio !=
                                          null &&
                                      localNomineeWithoutCategoryBlocState
                                              .getNomineeImage !=
                                          null &&
                                  localNomineeWithoutCategoryBlocState
                                      .getNomineeCountry  != null &&
                                  localNomineeWithoutCategoryBlocState
                                      .getNomineeState != null
                                  ? Color(0xffE5306C)
                                  : Color(0x65E5306C),
                          onPressed: () {
                            localNomineeWithoutCategoryBlocState
                                            .getNomineeName !=
                                        null &&
                                    localNomineeWithoutCategoryBlocState
                                            .getNomineeBio !=
                                        null &&
                                    localNomineeWithoutCategoryBlocState
                                            .getNomineeImage !=
                                        null &&
                                localNomineeWithoutCategoryBlocState
                                    .getNomineeCountry  != null &&
                                localNomineeWithoutCategoryBlocState
                                    .getNomineeState != null
                                ? _save(contestBloc,
                                    localNomineeWithoutCategoryBlocState)
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
