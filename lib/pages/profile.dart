import 'dart:ui';

import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/profile_edit.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/shared/menu_screen_util.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'add_contest.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _menuAppBar(context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: Theme.of(context).iconTheme.copyWith(
            size: 34.0,
            color: Colors.white,
          ),
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    return Scaffold(
      appBar: _menuAppBar(context),
      drawer: _pageDrawer(context),
      body: CustomScrollView(
        slivers: <Widget>[
//          USER PROFILE BIO SECTION
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _userProfileBar(screenHeight, screenWidth, userProfileBloc),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.09),
                  child: recentContestHeader('See All Contest'),
                ),
                Container(
                  height: screenHeight * 0.18,
                  margin: EdgeInsets.symmetric(vertical: 6.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      miniContestCardWidget(
                        context: context,
                        contestImgUrl: miniContestData[0].contestImgUrl,
                        contestTitle: miniContestData[0].contestTitle,
                        onTap: () {},
                      ),
                      miniContestCardWidget(
                        context: context,
                        contestImgUrl: miniContestData[1].contestImgUrl,
                        contestTitle: miniContestData[1].contestTitle,
                        onTap: () {},
                      ),
//                      SEE ALL BUTTON
                      InkWell(
                        radius: 400.0,
                        onTap: () {},
                        child: Container(
                          width: 120.0,
                          height: 110.0,
                          margin: EdgeInsets.fromLTRB(2.0, 0.0, 4.0, 5.0),
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Stack(
                            overflow: Overflow.visible,
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image(
                                  width: 110.0,
                                  height: 75.0,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      miniContestData[1].contestImgUrl),
                                ),
                              ),
                              Container(
                                width: 110.0,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  color: Color(0xffE5306C).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
//          ACTIVITY FEED HEADER
          SliverToBoxAdapter(
            child: activityHeaderWidget('Activity Feed'),
          ),
          SliverPadding(
//            ACTIVITY NOTIFICATION BUILDER
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                ((BuildContext context, int index) {
                  ActivityNotification _activity =
                      activityNotificationData[index];
                  return activityNotificationWidget(
                    context: context,
                    userImgUrl: _activity.userImgUrl,
                    userName: _activity.userName,
                    contestImgUrl: _activity.contestImgUrl,
                  );
                }),
                childCount: activityNotificationData.length,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14.0),
          ),
        ],
      ),
      drawerScrimColor: Color(0XAA000000),
    );
  }

//  ACTIVITY HELPER METHODS

  Widget activityHeaderWidget(String title) {
    return Container(
      width: double.infinity,
      height: 40.0,
      color: capitalVotesTheme().primaryColor,
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

  // Helper method for building UI of User profile bar at profile screen
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
              radius: screenWidth * 0.12,
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
//        USERNAME INFO
        Text(
          userProfileBloc.getUserName != null
              ? '${userProfileBloc.getUserName}'
              : 'Capital Votes',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.black87,
              ),
        ),
//        USER BIO DESCRIPTION
        SizedBox(
          width: 230.0, // to contain text // might need better implementation
          child: Text(
            userProfileBloc.getBio != null
                ? '${userProfileBloc.getBio}'
                : 'My awesome profile bio is still loading..'
                    '...feel free me to contact me though. hello bold world',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          ),
        ),
//        USER WEBSITE
        if (userProfileBloc.getWebsite != null)
          RichText(
            text: TextSpan(
              text: '${userProfileBloc.getWebsite}',
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: CupertinoColors.activeBlue,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
//        USER COUNTRY
        if (userProfileBloc.getCountry != null)
          Text(
            '${userProfileBloc.getCountry}',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0),
        ),
//        USER PROFILE BIO BUTTONS
        UserProfileBtns(),
      ],
    );
  }

//  Helper method to build the UI buttons for profile bar

} // end

class UserProfileBtns extends StatelessWidget {
  Widget _smallBtnWidget(String title, VoidCallback onPressed) {
    return SizedBox(
      width: 96.0,
      height: 28.0,
      child: RaisedButton(
//        padding: EdgeInsets.symmetric(
//          vertical: _verticalPadding,
//          horizontal: _horizontalPadding,
//        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(title,
            style: capitalVotesTheme().textTheme.button.copyWith(
                  fontSize: 12.0,
                )),
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
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0) // to space button away from each other
            ),
        _smallBtnWidget('Promotion', () {}),
      ],
    );
  }
} // of user profile btn class

Widget recentContestHeader(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

class MiniContestCard {
  String contestImgUrl;
  String contestTitle;

  MiniContestCard({this.contestImgUrl, this.contestTitle});
}

Widget miniContestCardWidget({
  BuildContext context,
  String contestImgUrl,
  String contestTitle,
  VoidCallback onTap,
}) {
//  double _width = context.size.height * 0.05;
//  double _height = context.size.height * 0.03;
  BorderRadius _borderRadius = BorderRadius.circular(12.0);
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 100.0,
//      height: 20.0,
      margin: EdgeInsets.fromLTRB(2.0, 0.0, 4.0, 5.0),
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: _borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: _borderRadius,
            child: Image(
              width: 93.0,
              height: 65.0,
              fit: BoxFit.cover,
              image: AssetImage(contestImgUrl),
            ),
          ),
          Text(
            '$contestTitle',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

List<MiniContestCard> miniContestData = [
  MiniContestCard(
    contestTitle: 'MMG Awards 2020',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  MiniContestCard(
    contestTitle: 'MMG Awards 2020',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
];

class ActivityNotification {
  String userImgUrl;
  String userName;
  String contestImgUrl;

  ActivityNotification({this.userImgUrl, this.userName, this.contestImgUrl});
}

/*
*
* This is dummy data just to ensure functionality of the app
* it should be removed
*
*
*/
List<ActivityNotification> activityNotificationData = [
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
  ActivityNotification(
    userImgUrl: 'images/logo.png',
    userName: 'Cleft G',
    contestImgUrl: 'images/default_cover_pic.jpg',
  ),
];

Widget activityNotificationWidget(
    {BuildContext context, userImgUrl, userName, contestImgUrl}) {
  return Container(
    height: 20.0,
    margin: EdgeInsets.symmetric(
      vertical: 12.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 22.0,
          child: ClipOval(
            child: Image.asset(
              userImgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '$userName voted on your contest',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          '10h ago',
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image(
            width: 30.0,
            height: 20.0,
            fit: BoxFit.cover,
            image: AssetImage(contestImgUrl),
          ),
        ),
      ],
    ),
  );
}

// Helper method for building drawer
Widget _pageDrawer(BuildContext context) {
  return Container(
    width: 240.0, // width of Drawer
    child: Drawer(
        elevation: 24.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1435,
              padding: EdgeInsets.fromLTRB(
                  30.0, 25.0, 0.0, 0.0), // push text to the left a little
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Capital Votes',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),

//      OPTIONS in the drawer
//      Edit profile option
            menuOption('Edit Profile', () {
              pushGoTo(context, ProfileEdit());
              debugPrint('it works 0001');
            }, Icons.edit),

//      Create Contest option
            menuOption('Create Contest', () {
              pushGoTo(context, AddContest());
              debugPrint('it works 0002');
            }, Icons.add_circle),

            menuOption(
              'Payment Method',
              () {},
              Icons.credit_card,
            ),
            menuOption(
              'Promotion',
              () {},
              Icons.share,
            ),
            menuOption(
              'Vote Analytics',
              () {},
              Icons.pie_chart,
            ),
            menuOption(
              'Tell Your Friends',
              () {},
              Icons.supervised_user_circle,
            ),
            menuOption(
              'Privacy',
              () {},
              Icons.lock,
            ),
            menuOption(
              'Help',
              () {},
              Icons.help,
            ),
            menuOption(
              'About Us',
              () {},
              Icons.info,
            ),
            SizedBox(height: 42.0),
            Divider(),
            logOutButton,
          ],
        )),
  );
}
