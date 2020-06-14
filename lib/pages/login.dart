import 'package:capitalvotes/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/services/sign_in_authentication.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthenticationService _authenticate = new AuthenticationService();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Loading();
  }

//  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
// Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;
    return loading
        ? Loading()
        : Builder(
            builder: (BuildContext context) => Container(
              alignment: Alignment.center,
              height: screenHeight,
              width: screenWidth,
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("images/logo.png"),
                        radius: screenHeight * 0.09,
                      ),
                    ),
                    SizedBox(height: screenHeight / 59.2),
                    Center(
                        child: Text('Sign in',
                            style: Theme.of(context).textTheme.headline6)),
                    SizedBox(height: screenHeight / 3.5),
                    Container(
                      height: screenHeight * 0.09,
                      width: screenWidth * 0.40,
                      child: RaisedButton(
                          onPressed: () async {
                            dynamic response =
                                await _authenticate.signInWithGoogle();
                            setState(() {
                              loading = true;
                            });

                            if (response == null) {
                              setState(() {
                                loading = false;
                              });
                              final snackBar = SnackBar(
                                content: Text('Yay! A SnackBar!'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );

                              // Find the Scaffold in the widget tree and use
                              // it to show a SnackBar.
                              Scaffold.of(context).showSnackBar(snackBar);
                              print('User unable to login');
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              child: Text('Sign in with Google',
                                  style: Theme.of(context).textTheme.button))),
                    ),
                    SizedBox(height: screenHeight / 30.8),
                    Container(
                      height: screenHeight * 0.09,
                      width: screenWidth * 0.8,
                      child: RaisedButton(
                          padding: EdgeInsets.only(top: screenWidth * 0.054, bottom: screenWidth * 0.054),
                          color: Color(0xff3B5998),
                          onPressed: () async {
                            dynamic response =
                                await _authenticate.signInWithFacebook();
                            setState(() => loading = true);
                            if (response == null) {
                              setState(() => loading = false);
                              SnackBar(
                                  content: Text(
                                'Unable to login',
                                style: Theme.of(context).textTheme.button,
                              ));
                              print('User unable to login');
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                            child: Text(
                              'Sign in with Facebook',
                              style: Theme.of(context).textTheme.button,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
