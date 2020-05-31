import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/profile_edit.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/shared/menu_screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_contest.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _menuAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: Theme.of(context).iconTheme.copyWith(size: 34.0),
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
      drawer: pageDrawer(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _userProfileBar(screenHeight, screenWidth, userProfileBloc),
                Divider(),
//                ListView.builder(
//                  itemBuilder: (b) ,
//
//                ),
                activityHeaderWidget(context, 'Activity Feed'),
              ],
            ),
          ),
        ],
      ),
      drawerScrimColor: Color(0X99FFFFFF),
    );
  }

//  ACTIVITY HELPER METHODS

  Widget activityHeaderWidget(context, String title) {
    return Container(
      width: double.infinity,
      height: 50.0,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
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
    return Container(
      width: screenWidth,
      height: screenHeight * 0.35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
//          PROFILE IMAGE
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: screenWidth * 0.13,
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
                fontWeight: FontWeight.w900,
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
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
          ),
        ),
//        USER WEBSITE
        if (userProfileBloc.getWebsite != null)
          RichText(
            text: TextSpan(
              text: '${userProfileBloc.getWebsite}',
              style: DefaultTextStyle.of(context).style,
            ),
          ),
//        USER COUNTRY
        if (userProfileBloc.getCountry != null)
          Text('${userProfileBloc.getCountry}'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
        ),
//        USER PROFILE BIO BUTTONS
        _userProfileBtns(),
      ],
    );
  }

//  Helper method to build the UI buttons for profile bar
  Widget _userProfileBtns() {
    RaisedButton _smallBtnWidget(String title, VoidCallback onPressed) {
      double _verticalPadding = 8.0;
      double _horizontalPadding = 16.5;
      return RaisedButton(
        padding: EdgeInsets.symmetric(
          vertical: _verticalPadding,
          horizontal: _horizontalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: onPressed,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _smallBtnWidget('Contact', () {}),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        _smallBtnWidget('Promotion', () {}),
      ],
    );
  }
} // end of class

class ActivityNotification {
  String userImgUrl;
  String userName;
  String contestImgUrl;

  ActivityNotification({this.userImgUrl, this.userName, this.contestImgUrl});
}

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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20.0,
          child: ClipOval(
            child: Image.asset(
              userImgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Text('$userName voted on your contest'),
        ),
        Text('10h ago'),
        Image(
          width: 100.0,
          height: 20.0,
          fit: BoxFit.cover,
          image: AssetImage(contestImgUrl),
        ),
      ],
    ),
  );
}

//Widget activityBuilder(){
//  return
//}

// Helper method for building drawer
Widget pageDrawer(BuildContext context) {
  return Container(
    width: 240.0,
    child: Drawer(
      elevation: 24.0,
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200.0,
          padding: EdgeInsets.only(left: 30.0), // push text to the left a little
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

        menuOption('Payment Method', () {}, Icons.credit_card),
        menuOption('Promotion', () {}, Icons.share),
        menuOption('Vote Analytics', () {}, Icons.pie_chart),
        menuOption('Tell Your Friends', () {}, Icons.supervised_user_circle),
        menuOption('Privacy', () {}, Icons.lock),
        menuOption('Help', () {}, Icons.help),
        menuOption('About Us', () {}, Icons.info),
        SizedBox(height: 130.0),
        logOutButton,
      ],
    )),
  );
}
