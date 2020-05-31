import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/imagecapture.dart';
import 'package:capitalvotes/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/multiline_textfield.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:provider/provider.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = [
    'Select Gender',
    'Male',
    'Female'
  ]; // Strings for the Gender dropdown values

  Country _selected;

  _multiLineNav() => pushGoTo(context, MultiLineTextField(location: 'profile'));

  _save(userProfileBloc) {
    userProfileBloc.setCountry = _selected;
    print('The contest Image string is: ${userProfileBloc.getUserImage}');
    print('The User fullName is: ${userProfileBloc.getFullName}');
    print('The User username is: ${userProfileBloc.getUserName}');
    print('The Users Bio is: ${userProfileBloc.getBio}');
    print('The user Website is: ${userProfileBloc.getWebsite}');
    print('The users email Date is: ${userProfileBloc.getEmail}');
    print('The Users gender is: ${userProfileBloc.getGender}');
    print('The users Phone no: ${userProfileBloc.getPhoneNo}');
    print('The users Country: ${userProfileBloc.getCountry}');
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.


      pushGoTo(context, Profile());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    return Scaffold(
        appBar: topAppBar('Edit Profile'),
        backgroundColor: Colors.white,
        body: Builder(
            builder: (context) => ListView(children: <Widget>[
                  Container(
                      height: screenHeight * 0.15,
                      width: screenWidth,
                      color: Color(0xffE5306C),

                      child:
                          Stack(overflow: Overflow.visible, children: <Widget>[
                        Positioned(
                            bottom: -(screenHeight * 0.04),
                            left: screenWidth * 0.36,
                            child: InkWell(
                                onTap: () {
                                  pushGoTo(
                                      context,
                                      ImageCapture(
                                        location: 'edit_profile',
                                      ));
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: screenHeight * 0.07,
                                  child: ClipOval(
                                      child: SizedBox(
                                          width: 98.0,
                                          height: 98.0,
                                          child: userProfileBloc.getUserImage !=
                                                  null
                                              ? Image.memory(
                                                  stringToImageFile(
                                                      userProfileBloc
                                                          .getUserImage),
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'images/aa.jpg',
                                                  fit: BoxFit.cover,
                                                  height: screenHeight * 0.25,
                                                  width: screenWidth,
                                                ))),
//
                                ))),
                        Positioned(
                          bottom: -(screenHeight * 0.03),
                          left: screenWidth * 0.59,
                          child: CircleAvatar(
                              backgroundColor: Color(0xffE5306C),
                              radius: screenHeight * 0.02,
                              child: Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                              )),
                        )
                      ])),
                  SizedBox(height: screenHeight * 0.05),
                  Center(
                    child: Text('Change profile picture',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C))),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, right: 16.0, bottom: 20.0, left: 16.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  'Full Name',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Container(
                                    height: screenHeight * 0.06,
                                    padding: EdgeInsets.all(0.0),
                                    child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 16.0),
                                        autovalidate: true,
                                        initialValue:
                                            userProfileBloc.getFullName == null
                                                ? ''
                                                : userProfileBloc.getFullName,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0X553D2960))),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:  Color(0X553D2960))),
                                            hintText: 'Full Name',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'poppins',
                                                color: Color(0X553D2960),
                                                fontStyle: FontStyle.italic,
                                                textBaseline:
                                                    TextBaseline.alphabetic),
                                            filled: true,
                                            fillColor: Colors.white),
                                        onChanged: (value) => userProfileBloc
                                            .setFullName = value)),
                                SizedBox(height: 10.0),
                                Text(
                                  'Username',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Container(
                                    height: screenHeight * 0.06,
                                    padding: EdgeInsets.all(0.0),
                                    child: TextFormField(
                                        initialValue:
                                            userProfileBloc.getUserName == null
                                                ? ''
                                                : userProfileBloc.getUserName,
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
                                            hintText: 'Username',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'poppins',
                                                color: Color(0X553D2960),
                                                fontStyle: FontStyle.italic,
                                                textBaseline:
                                                    TextBaseline.alphabetic),
                                            filled: true,
                                            fillColor: Colors.white),
                                        onChanged: (value) => userProfileBloc
                                            .setUserName = value)),
                                SizedBox(height: 10.0),
                                Text(
                                  'Bio',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                InkWell(
                                  onTap: _multiLineNav,
                                  child: Container(
                                    height: screenHeight * 0.06,
                                    width: screenWidth,
                                    padding: EdgeInsets.only(
                                        top: 4.0,
                                        right: 8.0,
                                        bottom: 0.0,
                                        left: 8.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: Color(0X553D2960)),
                                        color: Colors.white),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        userProfileBloc.getBio == null
                                            ? 'Bio'
                                            : userProfileBloc.getBio,
                                        style: userProfileBloc.getBio == null
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
                                SizedBox(height: 10.0),
                                Text(
                                  'Website',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Container(
                                    height: screenHeight * 0.06,
                                    padding: EdgeInsets.all(0.0),
                                    child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 16.0),
                                        autovalidate: true,
                                        keyboardType: TextInputType.url,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0X553D2960))),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0X553D2960))),
                                            hintText: 'Website',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'poppins',
                                                color: Color(0X553D2960),
                                                fontStyle: FontStyle.italic,
                                                textBaseline:
                                                    TextBaseline.alphabetic),
                                            filled: true,
                                            fillColor: Colors.white),
                                        onChanged: (value) => userProfileBloc
                                            .setWebsite = value)),
                                SizedBox(height: 10.0),
                                Text(
                                  'Gender',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Color(0X553D2960)),
                                      color: Colors.white),
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      value: genders[0],
                                      items: genders
                                          .map((gender) => DropdownMenuItem(
                                              value: gender,
                                              child: Text(gender,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2)))
                                          .toList(),
                                      onChanged: (String genderSelected) =>
                                          userProfileBloc.setGender =
                                              genderSelected),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Center(
                                  child: Text('Private info',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'poppins',
                                          color: Color(0xffE5306C))),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Text(
                                  'Email',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Container(
                                    height: screenHeight * 0.06,
                                    padding: EdgeInsets.all(0.0),
                                    child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 16.0),
                                        autovalidate: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0X553D2960))),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0X553D2960))),
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'poppins',
                                                color: Color(0X553D2960),
                                                fontStyle: FontStyle.italic,
                                                textBaseline:
                                                    TextBaseline.alphabetic),
                                            filled: true,
                                            fillColor: Colors.white),
                                        onChanged: (value) =>
                                            userProfileBloc.setEmail = value)),
                                SizedBox(height: 10.0),
                                Text(
                                  'Phone Number',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Container(
                                    height: screenHeight * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border:
                                            Border.all(color: Color(0X553D2960))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  right: 0.0, left: 0.0),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        //                   <--- left side
                                                        color:
                                                        Color(0X553D2960),
                                                        width: 0.5)),
                                                color: Colors.white,
                                              ),
                                              child: CountryPicker(
                                                  dense: false,
                                                  showFlag: false,
                                                  //displays flag, true by default
                                                  showDialingCode: true,
                                                  //displays dialing code, false by default
                                                  showName: false,
                                                  //displays country name, true by default
                                                  showCurrency: false,
                                                  //eg. 'British pound'
                                                  showCurrencyISO: false,
                                                  //eg. 'GBP'
                                                  onChanged: (Country country) {
                                                    userProfileBloc.setCountry =
                                                        country.name;
                                                    print(
                                                        'This is the country zip Code ${userProfileBloc.getCountry}.');
                                                    setState(() {
                                                      _selected = country;
                                                    });
                                                  },
                                                  selectedCountry: _selected,
                                                  dialingCodeTextStyle:
                                                      TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: 'poppins',
                                                          color:
                                                              Color(0xffE5306C),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: TextFormField(
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                textAlign: TextAlign.left,
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                                autovalidate: true,
                                                initialValue:
                                                    userProfileBloc.getPhoneNo == null
                                                        ? ''
                                                        : userProfileBloc
                                                            .getPhoneNo,
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(0X553D2960))),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide
                                                                .none),
                                                    hintText: 'Phone Number',
                                                    hintStyle: TextStyle(
                                                        fontSize: 14.0,
                                                        fontFamily: 'poppins',
                                                        color: Color(0X553D2960),
                                                        fontStyle: FontStyle.italic,
                                                        textBaseline: TextBaseline.alphabetic),
                                                    filled: true,
                                                    fillColor: Colors.white),
                                                onChanged: (value) => userProfileBloc.setPhoneNo = value),
                                          ),
                                        ])),
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
                                      userProfileBloc.setCountry = country.name;
                                      print(
                                          'This is the country ${userProfileBloc.getCountry}.');
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
                                SizedBox(height: screenHeight * 0.1),
                                Container(
                                    width: screenWidth,
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02,),
                                        color:
                                            userProfileBloc.getFullName != null &&
                                                userProfileBloc.getUserImage !=
                                                        null &&
                                                    userProfileBloc
                                                            .getUserName !=
                                                        null &&
                                                    userProfileBloc.getBio !=
                                                        null &&
                                                    userProfileBloc.getGender !=
                                                        null &&
                                                    userProfileBloc.getEmail !=
                                                        null &&
                                                    userProfileBloc
                                                            .getPhoneNo !=
                                                        null &&
                                                    userProfileBloc
                                                            .getCountry !=
                                                        null
                                                ? Color(0xffE5306C)
                                                : Color(0x65E5306C),
                                        onPressed: () {
                                          userProfileBloc.getFullName != null &&
                                              userProfileBloc.getUserImage != null &&
                                                  userProfileBloc.getUserName !=
                                                      null &&
                                                  userProfileBloc.getBio !=
                                                      null &&
                                                  userProfileBloc.getGender !=
                                                      null &&
                                                  userProfileBloc.getEmail !=
                                                      null &&
                                                  userProfileBloc.getPhoneNo !=
                                                      null &&
                                                  userProfileBloc.getCountry !=
                                                      null
                                              ? _save(userProfileBloc)
                                              : print('Not enabled');
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Text('Save',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button)))
                              ])))
                ])));
  }
}
