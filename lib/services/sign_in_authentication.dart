import 'dart:math';
import 'package:capitalvotes/blocs/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
// Add these three variables to store the info
// retrieved from the FirebaseUser

  var rng = new Random();
  String firstName;
  String lastName;
  String userName;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Function to get Users object from firebase

  User _userFromFirebase(FirebaseUser user) {
    if (user != null) {
      String uId = user.uid;
      if (user.displayName != null) {
        String name = user.displayName;
        this.firstName = name.substring(0, name.indexOf(' ')) != null
            ? name.substring(0, name.indexOf(' '))
            : '';
        this.lastName = name.substring(
                  (name.indexOf(' ') + 1),
                ) !=
                null
            ? name.substring(
                (name.indexOf(' ') + 1),
              )
            : '';
        String thirdPart = rng.nextInt(100).toString();
        this.userName = firstName != null && lastName != null
            ? firstName + lastName + thirdPart
            : '';
      } else {
        this.firstName = '';
        this.lastName = '';
        this.userName = '';
      }
      dynamic email = user.email != null ? user.email : '';
      User _user = User(
          uId: uId,
          firstName: this.firstName,
          lastName: this.lastName,
          userName: this.userName,
          email: email);
      print('user existed : $_user');
      return _user;
    } else {
      print('user do not exist');
      return null;
    }
  }

  // authenticated user stream

  Stream<User> get authenticatedUser {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }



// Google Sign in Authentication
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSign = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleSign.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser googleUser =
          (await _auth.signInWithCredential(credential)).user;

      return _userFromFirebase(googleUser);
    }catch (e) {
      return null;
    }
  }


// Google sign out code

  void signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Sign Out");
  } //signOutGoogle



// Facebook Sign Code

  final FacebookLogin facebookLogin = new FacebookLogin();

  Future signInWithFacebook() async {
    try {
      final FacebookLoginResult result = await facebookLogin.logIn(['email']);
      final FacebookAccessToken accessToken = result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.getCredential(accessToken: accessToken.token);

      FirebaseUser fbUser = (await _auth.signInWithCredential(credential)).user;

      return _userFromFirebase(fbUser);
    } catch (e) {

      print('Error with user sign in');
      return null;
    }
  }
  // Google sign out code

  void signOutFacebook() async {
    await facebookLogin.logOut();
  } //facebook signOut

}
