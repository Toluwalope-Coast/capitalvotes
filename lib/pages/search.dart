import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  OutlineInputBorder searchBorderDefault = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.grey[200],
    ),
    borderRadius: BorderRadius.circular(50.0),
  );
  //border style when input is in focus
  OutlineInputBorder searchBorderFocused = formBorderDefault.copyWith(
    borderSide: BorderSide(
      color: capitalVotesTheme().primaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(50.0),
  );

  InputDecoration searchInputDecoration(String hintText, EdgeInsets padding) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      contentPadding: padding,
      enabledBorder: searchBorderDefault,
      focusedBorder: searchBorderFocused,
    );
  }

  TextStyle _headingTxtStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  TextStyle _bodyTxtStyle = TextStyle(
    fontSize: 10.0,
  );

  TextStyle _heading2TxtStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: capitalVotesTheme().primaryColor,
  );

  TextEditingController searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(12.0, 55.0, 12.0, 12.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
//          SEARCH BAR
          Container(
            margin: EdgeInsets.symmetric(vertical: 23.0),
            child: TextField(
              controller: searchFieldController,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              cursorColor: capitalVotesTheme().primaryColor,
              decoration: searchInputDecoration(
                'Search....',
                EdgeInsets.symmetric(vertical: 14.5, horizontal: 18.0),
              ).copyWith(
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          //BUILD WIDGET FOR NOMINEE RESULTS
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: searchInfoUserData.length,
            itemBuilder: ((BuildContext context, int index) {
              SearchInfoUser data = searchInfoUserData[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 2.5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey[200]),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: ClipOval(
                      child: Image.asset(
                        data.imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  dense: true,
                  title: Text(
                    data.name,
                    style: _headingTxtStyle,
                  ),
                  subtitle: Text(
                    data.description,
                    style: _bodyTxtStyle,
                  ),
                ),
              );
            }),
          ),
//          SEE ALL BUTTON
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: _heading2TxtStyle,
              ),
            ),
          ),
//          SHOW CONTEST HEADER IF THERE ARE CONTEST IN RESULT
          Text(
            'Contest',
            style: _heading2TxtStyle,
          ),
//          BUILD WIDGET FOR CONTEST RESULTS
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: searchInfoContestData.length,
              itemBuilder: ((BuildContext context, int index) {
                SearchInfoContest data = searchInfoContestData[index];
                return searchResultCard(
                    data.ongoing,
                    data.creatorImgUrl,
                    data.contestBanner,
                    data.contestDescription,
                    data.contestName,
                    data.creatorUsername);
              }))
        ],
      ),
    );
  }

//  SEARCH RESULT CARD WIDGET
  Widget searchResultCard(
    bool ongoing,
    String leadingImgUrl,
    String trailingImgUrl,
    String description,
    String title,
    String subtitle,
  ) {
//    Helper methods for building custom card widget
    Widget _header() {
      return SizedBox(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 20.0,
              child: ClipOval(
                  child: Image.asset(leadingImgUrl, fit: BoxFit.cover)),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0),
                  ),
                  Text(subtitle, style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _about() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            child: Text(description, style: _bodyTxtStyle),
          ),
          Text(
            ongoing ? 'Ongoing contest' : '',
            style: TextStyle(
              color: capitalVotesTheme().primaryColor,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    Widget _aside() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image(
          width: 80.0,
          height: 70.0,
          fit: BoxFit.cover,
          image: AssetImage(trailingImgUrl),
        ),
      );
    }

//   main custom search card widget
    return Container(
      constraints: BoxConstraints(minHeight: 140.0, maxHeight: 200.0),
      padding: EdgeInsets.fromLTRB(12.5, 14.0, 12.5, 8.0),
      margin: EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200], width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
//
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//
          Expanded(
            child: Column(
              children: <Widget>[
                _header(),
                Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                Expanded(child: _about()),
              ],
            ),
          ),
//
          _aside(),
//
        ],
      ),
    );
  }
}

class SearchInfoUser {
  String name;
  String description;
  String imgUrl;

  SearchInfoUser({this.name, this.description, this.imgUrl});
}

List searchInfoUserData = [
  SearchInfoUser(
    name: 'Michael Joe',
    description: 'Lorem ipsum dolor sit',
    imgUrl: 'images/logo.png',
  ),
  SearchInfoUser(
    name: 'Joe Michael',
    description: 'Lorem ipsum dolor sit',
    imgUrl: 'images/logo.png',
  ),
  SearchInfoUser(
    name: 'Michael Joeboy',
    description: 'Lorem ipsum dolor sit',
    imgUrl: 'images/logo.png',
  ),
];

List searchInfoContestData = [
  SearchInfoContest(
    ongoing: true,
    creatorImgUrl: 'images/logo.png',
    contestBanner: 'images/default_cover_pic.jpg',
    contestDescription:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud ',
    contestName: 'Face of capital votes',
    creatorUsername: 'CAPITAL VOTES',
  ),
  SearchInfoContest(
    ongoing: true,
    creatorImgUrl: 'images/logo.png',
    contestBanner: 'images/default_cover_pic.jpg',
    contestDescription:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud ',
    contestName: 'BBN 2020',
    creatorUsername: 'Multichoice',
  ),
  SearchInfoContest(
    ongoing: true,
    creatorImgUrl: 'images/logo.png',
    contestBanner: 'images/default_cover_pic.jpg',
    contestDescription:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud ',
    contestName: 'WHO WANT TO BE A MILLIONAIRE',
    creatorUsername: 'MTN-NG',
  ),
];

class SearchInfoContest {
  bool ongoing;
  String creatorImgUrl;
  String contestBanner;
  String contestDescription;
  String contestName;
  String creatorUsername;

  SearchInfoContest(
      {this.ongoing,
      this.creatorImgUrl,
      this.contestBanner,
      this.contestDescription,
      this.contestName,
      this.creatorUsername});
}
