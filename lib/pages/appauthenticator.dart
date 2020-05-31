import 'package:capitalvotes/blocs/user.dart';
import 'package:capitalvotes/pages/pageloader.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:provider/provider.dart';

class AppAuthenticator extends StatefulWidget {
  @override
  _AppAuthenticatorState createState() => _AppAuthenticatorState();
}

class _AppAuthenticatorState extends State<AppAuthenticator> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<User>(context);
    if (appUser == null) {
      return Login();
    } else{
      return PageLoader();
    }
  }
}
