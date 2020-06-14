import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/theme.dart';

class SeeAllContestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    Widget _screenAppbar = AppBar(
      automaticallyImplyLeading: true,
      title: Text(
        'All contests',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
      titleSpacing: 2.0,
//      actions: <Widget>[
//        IconButton(
//          iconSize: 26.0,
//          color: Colors.white,
//          icon: Icon(Icons.menu),
//          onPressed: () {},
//        )
//      ],
    );
    return Scaffold(
      appBar: _screenAppbar,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'BEST MALE DANCER OF THE YEAR',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: capitalVotesTheme().primaryColor,
              iconSize: 22.0,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
