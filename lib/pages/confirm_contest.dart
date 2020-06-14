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
        title: Text('Confirm Contest', style: TextStyle(fontSize: 16.0)),
        elevation: 0.0,
        titleSpacing: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Container(
              width: screenWidth * 0.3,
              child: FlatButton(onPressed: () {

                Navigator.of(context).pushNamedAndRemoveUntil('/CreatorContestView', ModalRoute.withName('/Home'));},

                padding: const EdgeInsets.all(0.0),
                child: Text('Confirm', style: TextStyle(fontFamily: 'poppins', fontSize: 16.0, color: Colors.white)),),
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
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Text(
                  contestBloc.getContestName != null ? contestBloc.getContestName : 'Contest Name',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      color: Color(0Xff2e2d2d),
                      fontWeight: FontWeight.bold),
                ),
                contestBloc.getContestDescription != null ?
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child:  Text(contestBloc.getContestDescription,
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 12,
                          color: Color(0Xff2e2d2d)), textAlign: TextAlign.center,),
                ) : Container(height: 0.0),
                Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.alarm,
                      color: Color(0xffE5306C),
                      size: 12,
                    ),
                    Text('Votes ends ',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C))),
                    Text(
                        contestBloc.getEndDate,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C),
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
        Divider(height: screenHeight * 0.01),
          contestBloc.getIsCategory == true ?
        Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: screenWidth, height: screenHeight * 0.3),
          child: ListView.builder(
              itemCount: contestBloc.contestCategoryList.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 16.0, right: 16.0),
                title: Text(
                    '${contestBloc.contestCategoryList[index].categoryName}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    )
                ),
              )),
        )
          : Container(height: 0.0, width: 0.0),
          contestBloc.getIsCategory == true ?
          Divider(height: screenHeight * 0.01): Container(height: 0.0, width: 0.0),
        contestBloc.getVoteRate != null ?
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vote Cost', style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600)),
            Container(
              alignment: Alignment.center,
                height: screenHeight * 0.06,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0X553D2960)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    color: Colors.white),
                child: Text(contestBloc.getVoteRate.toString(), )),
          ],
        ),
      )
          : Container(height: 0.0, width: 0.0),
          SizedBox(height: screenHeight * 0.1)
        ]
      ),
    );
  }
}
