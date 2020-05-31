import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:provider/provider.dart';

class ConfirmContest extends StatefulWidget {

  @override
  _ConfirmContestState createState() => _ConfirmContestState();
}

class _ConfirmContestState extends State<ConfirmContest> {

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Confirm Contest',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Container(
              width: screenWidth * 0.2,
              child: FlatButton(onPressed: () {

                Navigator.of(context).pushNamedAndRemoveUntil('/CreatorContestView', ModalRoute.withName('/Home'));},

                padding: const EdgeInsets.all(0.0),
                color: Color(0xffE5306C),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(50)),
                child: Text('Confirm', style: TextStyle(fontFamily: 'poppins', fontSize: 12.0, color: Colors.white)),),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: screenHeight * 0.30,
              width: screenWidth,
              color: Color(0Xee3D2960),
              child: Stack(overflow: Overflow.visible, children: <Widget>[
                Positioned.fill(
                    child: contestBloc.getContestBanner == null
                        ? Image.asset('images/default_cover_pic.jpg', fit: BoxFit.cover)
                        : Image.memory(stringToImageFile(contestBloc.getContestBanner), fit: BoxFit.cover,)),
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
                    )
                )
              ])),
          SizedBox(height: screenHeight * 0.04),
          Center(
            widthFactor: screenWidth * 0.6,
            child: Column(
              children: <Widget>[
                Text(
                  contestBloc.getContestName != null ? contestBloc.getContestName : 'Contest Name',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 15,
                      color: Color(0Xff2e2d2d),
                      fontWeight: FontWeight.bold),
                ),
                contestBloc.getContestDescription != null ?
                Container(
                  width: screenWidth * 0.5,
                  child:  Text(contestBloc.getContestDescription,
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          color: Color(0Xff2e2d2d))),
                ) : Container(height: 0.0),
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
                        contestBloc.getEndDate != null
                            ? contestBloc.getEndDate
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
          Divider(height: screenHeight * 0.1),
        ]
      ),
    );
  }
}
