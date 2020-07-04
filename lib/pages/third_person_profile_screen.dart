import 'dart:ui';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OtherProfileScreen extends StatefulWidget {
  @override
  _OtherProfileScreenState createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          tooltip: 'options',
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              offset: Offset(0.0, 12.0),
              itemBuilder: ((BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: FlatButton(
                      child: Text(
                        'Report...',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: () {
                        pushGoTo(context, '/VoteAnalyticScreen');
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      child: Text(
                        'Copy Profile Link',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      child: Text(
                        'Share to...',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ];
              }))
        ],
        iconTheme: Theme.of(context).iconTheme.copyWith(
              size: 34.0,
              color: Colors.black,
            ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _userProfileBar(screenHeight, screenWidth, userProfileBloc),
          activityHeaderWidget('Activity Feed'),
          ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "MMMG Awards 2020",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Icon(Icons.more_vert),
                          ),
                          color: capitalVotesTheme().primaryColor,
                          onPressed: () {},
                        )
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('images/default_cover_pic.jpg'),
                        ),
                      ),
                      decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(45.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x323D2960),
                            offset: Offset(0, 3),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                height: 300.0,
              ),
              Divider()
            ],
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
          )
        ],
      ),
    );
  }

  Widget activityHeaderWidget(String title) {
    return Container(
      width: double.infinity,
      height: 40.0,
      color: capitalVotesTheme().primaryColor,
      margin: EdgeInsets.symmetric(vertical: 18.0),
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _userProfileBar(
    double screenHeight,
    double screenWidth,
    UserProfileBloc userProfileBloc,
  ) {
    EdgeInsets _containerPadding = EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 8.0);
    return Container(
      constraints: BoxConstraints(
        minWidth: screenWidth,
        minHeight: screenHeight * 0.22,
        maxWidth: screenWidth,
        maxHeight: 340.0,
      ),
      padding: _containerPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
//          PROFILE IMAGE
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: MediaQuery.of(context).size.width < 360
                  ? screenWidth * 0.1
                  : screenWidth * 0.12,
              child: ClipOval(
                child: userProfileBloc.getUserImage != null
                    ? Image.memory(
                        stringToImageFile(userProfileBloc.getUserImage),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'images/logo.png',
                        fit: BoxFit.cover,
                      ),
              ),
//
            ),
          ),
//          PROFILE INFO
          FittedBox(child: _userProfileBarInfo(userProfileBloc)),
        ],
      ),
    );
  }

  // Helper method to build info section UI of profile page
  Widget _userProfileBarInfo(UserProfileBloc userProfileBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          userProfileBloc.getUserName != null
              ? '${userProfileBloc.getUserName}'
              : 'Capital Votes',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width < 360 ? 14.0 : 16.0,
                color: Colors.black87,
              ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width < 360
              ? 200.0
              : 230.0, // to contain text // might need better implementation
          child: Text(
            userProfileBloc.getBio != null
                ? '${userProfileBloc.getBio}'
                : 'My awesome profile bio is still loading..',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width < 360 ? 10.0 : 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (userProfileBloc.getWebsite != null)
          RichText(
            text: TextSpan(
              text: '${userProfileBloc.getWebsite}',
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: CupertinoColors.activeBlue,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        if (userProfileBloc.getCountry != null)
          Text(
            '${userProfileBloc.getCountry}',
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
          ),
        Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
        ProfileButtonWidget(),
      ],
    );
  }
}

class ProfileButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _smallBtnWidget('Contact', () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            enableDrag: true,
            context: context,
            builder: (context) =>
                _contactBottomSheet(screenWidth, screenHeight),
          );
        }),
      ],
    );
  }

  Widget _smallBtnWidget(String title, VoidCallback onPressed) {
    return SizedBox(
      width: 96.0,
      height: 28.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(
          title,
          style: capitalVotesTheme().textTheme.button.copyWith(
                fontSize: 12.0,
              ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _contactBottomSheet(double screenWidth, double screenHeight) {
    return Container(
      height: 190.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
//
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text('contact'),
                ],
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Text('Call'),
            onTap: () {},
          ),
          ListTile(
            leading: Text('Email'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
