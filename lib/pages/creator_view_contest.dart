import 'dart:io';

import 'package:capitalvotes/pages/add_nominee_without_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatorViewContest extends StatefulWidget {
  final File contestImage;
  final File contestNomineeImage;


  CreatorViewContest({Key key, this.contestImage, this.contestNomineeImage})
      : super(key: key);

  @override
  _CreatorViewContestState createState() => _CreatorViewContestState();
}

class _CreatorViewContestState extends State<CreatorViewContest> {
  String contestName;
  String contestDescription;
  String contestEndDate;

  Future readContestFromPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      contestName = preferences.getString('contestName');
      contestDescription = preferences.getString('contestDescription');
      contestEndDate = preferences.getString('contestEndDate');
    });
  }

  @override
  Widget build(BuildContext context) {
    readContestFromPreference();
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: topAppBar3('Contest View', context),
      body: ListView(
        children: <Widget>[
          Container(
              height: screenHeight * 0.30,
              width: screenWidth,
              color: Color(0Xee3D2960),
              child: Stack(overflow: Overflow.visible, children: <Widget>[
                Positioned.fill(
                    child: widget.contestImage == null
                        ? Image.asset('images/default_cover_pic.jpg',
                            fit: BoxFit.cover)
                        : Image.file(
                            widget.contestImage,
                            fit: BoxFit.cover,
                          )),
                Positioned(
                    bottom: -(screenHeight * 0.04),
                    left: screenWidth * 0.36,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      child: ClipOval(
                          child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: Image.asset(
                                'images/logo.png',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.25,
                                width: screenWidth,
                              ))),
//
                    ))
              ])),
          SizedBox(height: screenHeight * 0.04),
          Center(
            widthFactor: screenWidth * 0.6,
            child: Column(
              children: <Widget>[
                Text(
                  contestName != null ? contestName : 'Contest Name',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 15,
                      color: Color(0Xff2e2d2d),
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: screenWidth * 0.5,
                  child: Text(
                      contestDescription != null
                          ? contestDescription
                          : 'contest Description',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          color: Color(0Xff2e2d2d))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.alarm,
                      color: Color(0xffE5306C),
                      size: 9,
                    ),
                    Text('Votes ends ',
                        style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C))),
                    Text(
                        contestEndDate != null
                            ? contestEndDate
                            : 'September 23',
                        style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C),
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: screenWidth,
            height: screenHeight * 0.04,
            color: Color(0xffE5306C),
            child: Text(
              'All Nominees',
              style: TextStyle(
                  fontFamily: 'poppins', color: Colors.white, fontSize: 14),
            ),
          ),
          Container(
            color: Colors.white,
            height: screenHeight * 0.5,
            width: screenWidth,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var contestPage = MaterialPageRoute(
              builder: (BuildContext context) => AddNomineeWithOutCategory());
          Navigator.of(context).push(contestPage);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xffE5306C),
      ),
    );
  }
}
