import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/blocs/view_nominee_bloc.dart';
import 'package:provider/provider.dart';

class ViewNominee extends StatefulWidget {
  @override
  _ViewNomineeState createState() => _ViewNomineeState();
}

class _ViewNomineeState extends State<ViewNominee> {

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;


    ViewNomineeLocalBloc viewNomineeLocalBloc = Provider.of<ViewNomineeLocalBloc>(context);


    return Scaffold(
      appBar: topAppBar(''),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
              height: screenHeight * 0.30,
              width: screenWidth,
              color: Color(0Xee3D2960),
              child: Stack(overflow: Overflow.visible, children: <Widget>[
                Positioned.fill(
                    child: Image.memory(
                      stringToImageFile(viewNomineeLocalBloc.getNomineeContestBanner),
                      fit: BoxFit.cover,
                    )),
              ])),
          SizedBox(height: screenHeight * 0.04),
          Center(
            widthFactor: screenWidth * 0.6,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.memory(
                    stringToImageFile(viewNomineeLocalBloc.getNomineeImage),
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  viewNomineeLocalBloc.getNomineeName,
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      color: Color(0Xff2e2d2d),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    viewNomineeLocalBloc.getNomineeProfession,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12,
                        color: Color(0Xff2e2d2d)),
                    textAlign: TextAlign.center,
                  ),
                ),
                    Text('Votes ends ',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C))),
                    Text(viewNomineeLocalBloc.getNomineeContestEndDate,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C),
                            fontWeight: FontWeight.bold))
                  ],
                )
          )
              ],
            ),
          );

  }
}
