import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/material.dart';

//Created by: Ajayi Eniola

// Menu option padding
EdgeInsets menuOptionPadding = EdgeInsets.symmetric(
  vertical: 20.0,
);

// Menu option text style
TextStyle menuOptionTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14.0,
  color: Colors.grey[900],
);

// Menu option border
Border menuOptionBorder = Border(
  bottom: BorderSide(
    width: 2.0,
    color: Colors.grey[200],
  ),
);

//Helper widget for creating menu options
Widget menuOption(String title, VoidCallback onPressed, IconData icon) {
  return ListTile(
    leading: Icon(
      icon,
      size: 24.0,
      color: Colors.grey[900],
    ),
    title: Text(
      title,
      style: menuOptionTextStyle,
    ),
    onTap: onPressed,
    dense: true,
  );
}

// Helper widget to create logOut button in UI
Widget logOutButton = InkWell(
  child: Container(
    padding: menuOptionPadding.copyWith(left: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.exit_to_app,
          color: capitalVotesTheme().primaryColor,
          size: 30.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 23.0),
        ),
        Text(
          'Log Out',
          style: menuOptionTextStyle.copyWith(
            color: capitalVotesTheme().primaryColor,
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  ),
);

// Helper widget to create LogOut button in UI
//Widget logOutButton = FlatButton.icon(
////  padding: menuOptionPadding.copyWith(
////    left: 0.0,
////  ),
//  icon: Icon(
//    Icons.exit_to_app,
//    color: capitalVotesTheme().primaryColor,
//    size: 30.0,
//  ),
//  label: Text(
//    'Log Out',
//    style: menuOptionTextStyle.copyWith(
//      color: capitalVotesTheme().primaryColor,
//      fontSize: 18.0,
//    ),
//  ),
//  shape: Border(
//    top: BorderSide(width: 2.0, color: Colors.grey[200]),
//  ),
//  onPressed: () {},
//);
