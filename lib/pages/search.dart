import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int feedCounts;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: !isSearching
              ? Text('Search')
              : TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: 'Search here . . . . . ',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'poppins')),
                ),
          elevation: 0.0,
        ),
        body: Column()
    );
  }
}
