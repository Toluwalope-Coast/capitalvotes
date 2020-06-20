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
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 23.0, horizontal: 18.0),
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
        ],
      ),
    );
  }
}

class SearchInfoUser {
  String name;
  String description;
  Widget leading;

  SearchInfoUser({this.name, this.description, this.leading});
}

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
