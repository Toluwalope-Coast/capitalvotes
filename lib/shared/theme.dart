import 'package:flutter/material.dart';

ThemeData capitalVotesTheme() {
  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
            fontFamily: 'poppins', fontSize: 22.0, color: Colors.grey),
        headline6: base.headline6.copyWith(
            fontFamily: 'poppins',
            fontSize: 20.0,
            color: Color(0XAA061536),
          fontWeight: FontWeight.w500,
        ),

        headline2: base.headline2.copyWith(
            fontFamily: 'poppins', fontSize: 24.0, color: Colors.white),
        headline3: base.headline3.copyWith(
            fontFamily: 'poppins', fontSize: 12.0, color: Color(0xffE5306C)),
        headline5: base.headline5.copyWith(
            fontFamily: 'poppins', fontSize: 16.0, color: Colors.white),
        headline4: base.headline4.copyWith(
            fontFamily: 'poppins', fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
        subtitle2: base.subtitle2.copyWith(
            fontFamily: 'poppins', fontSize: 10.0, color: Colors.white),
        subtitle1: base.subtitle1.copyWith(
            fontFamily: 'poppins', fontSize: 10.0, color: Colors.black87),
        button: base.button.copyWith(
            color: Colors.white,
            fontFamily: 'poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        bodyText1: base.bodyText1.copyWith(color: Colors.white, fontFamily: 'poppins'),
        bodyText2: base.bodyText2.copyWith(color: Color(0xff454f63), fontFamily: 'poppins', fontSize: 16.0));
  }

  ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: basicTextTheme(base.textTheme),
      primaryColor: Color(0xffE5306C),
      secondaryHeaderColor: Color(0xff0F275B),
      iconTheme: IconThemeData(color: Color(0XFF454F63), size: 18.0),
      indicatorColor: Color(0xffE5306C),
      scaffoldBackgroundColor: Colors.white,
      accentColor: Color(0xffE5306C),
      buttonTheme: base.buttonTheme.copyWith(buttonColor: Color(0xffE5306C)),
      buttonColor: Color(0xff2431D6),// 2431D6   0xff0F275B
      backgroundColor: Colors.white,
      appBarTheme: base.appBarTheme.copyWith(
          color: Color(0xffE5306C),
          actionsIconTheme:
              base.iconTheme.copyWith(color: Colors.white, size: 20.0)),
      tabBarTheme: base.tabBarTheme.copyWith(
        unselectedLabelColor: Colors.grey,
      ));
}
