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
    fontSize: 12.0,
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
        ],
      ),
    );
  }

  Widget searchInfoContestWidget(
    bool ongoing,
    String contestImageUrl,
    String contestBannerUrl,
    String contestDescription,
    String contestName,
    String contestCreator,
  ) {
    Widget _header() {
      return SizedBox(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 20.0,
              child: ClipOval(
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Face of capital votes',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'CAPITAL VOTES',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ],
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
            height: 80.0,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do '
              'eiusmod tempor incididunt ut labore et dolore magna aliqua.'
              ' Ut enim ad minim veniam, quis nostrud ',
              overflow: TextOverflow.ellipsis,
              style: _bodyTxtStyle,
            ),
          ),
          Text(
            'ongoing contest',
            style: TextStyle(
              color: capitalVotesTheme().primaryColor,
              fontSize: 12.0,
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
          image: AssetImage('images/default_cover_pic.jpg'),
        ),
      );
    }

    return Container(
      height: 180.0,
      padding: EdgeInsets.fromLTRB(12.5, 14.0, 12.5, 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200], width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                _header(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                ),
                Expanded(
                  child: _about(),
                ),
              ],
            ),
          ),
          _aside(),
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
    leadingImgUrl: 'images/logo.png',
    trailingImgUrl: 'images/default_cover_pic.jpg',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ' Ut enim ad minim veniam, quis nostrud ',
    contestName: 'Face of capital votes',
    contestCreator: 'CAPITAL VOTES',
  ),
];

class SearchInfoContest {
  bool ongoing;
  String leadingImgUrl;
  String trailingImgUrl;
  String description;
  String contestName;
  String contestCreator;

  SearchInfoContest(
      {this.ongoing,
      this.leadingImgUrl,
      this.trailingImgUrl,
      this.description,
      this.contestName,
      this.contestCreator});
}
