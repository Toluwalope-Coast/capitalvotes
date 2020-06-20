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
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    data.description,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              );
            }),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'See all',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: capitalVotesTheme().primaryColor,
              ),
            ),
          ),
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

class SearchInfoContest {
  bool ongoing;
  Widget leading;
  Widget trailing;
  String description;
  String contestName;
  String contestCreator;

  SearchInfoContest(
      {this.ongoing,
      this.leading,
      this.trailing,
      this.description,
      this.contestName,
      this.contestCreator});
}

//Widget searchInfoContestWidget() {
//  Widget _header(){
//    return SizedBox(
//      child: Row(
//        children: <Widget>[
////          CircleAvatar(
////            backgroundColor: Colors.grey[200],
////            radius: MediaQuery.of(context).size.width < 360
////                ? screenWidth * 0.1
////                : screenWidth * 0.12,
////            child: ClipOval(
////              child: userProfileBloc.getUserImage != null
////                  ? Image.memory(
////                stringToImageFile(userProfileBloc.getUserImage),
////                fit: BoxFit.cover,
////              )
////                  : Image.asset(
////                'images/logo.png',
////                fit: BoxFit.cover,
////              ),
////            ),
//////
////          ),
//          Column(
//            children: <Widget>[
//              Text(''),
//              Text(''),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//  Widget _about(){
//    return Column(
//      children: <Widget>[
//        Text(''),
//        Text('ongoing contest'),
//      ],
//    );
//  }
//  Widget _aside(){
//    return Image(
//      image: AssetImage(''),
//    );
//  }
//  return Row(
//    children: <Widget>[
//      Column(
//        children: <Widget>[
//          _header(),
//          _about(),
//        ],
//      ),
//      _aside(),
//    ],
//  );
//}
