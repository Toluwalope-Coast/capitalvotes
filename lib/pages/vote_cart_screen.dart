import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/blocs/view_nominee_bloc.dart';
import 'package:capitalvotes/services/vote_function_widget.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoteCartScreen extends StatefulWidget {
  @override
  _VoteCartScreenState createState() => _VoteCartScreenState();
}

class _VoteCartScreenState extends State<VoteCartScreen> {
  // SCREEN APP BAR
  final AppBar _screenAppBar = AppBar(
    leading: Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {}),
    ),
    title: Text(
      'Vote Cart',
      style: display2TextStyle.copyWith(
        color: Colors.white,
      ),
    ),
    elevation: 0.0,
    backgroundColor: capitalVotesTheme().primaryColor,
  );

  // VARIABLES
  AssetImage _contestantImg = AssetImage('assets/images/users/user-1.jpg');
  String _slctedContestantName = 'Chloe Hermann';
  String _slctedContestantDesc = 'Lagos, Nigeria';

  static double _bgContainerHeight = 90.0;
  static double _imgContainerWidth = 160.0;
  static double _imgContainerHeight = 240.0;
  static double _imgContainerRadius = 12.0;
  BoxDecoration _imgContainerDecoration = BoxDecoration(
    border: Border.all(color: Colors.white, width: 3.0),
    borderRadius: BorderRadius.circular(_imgContainerRadius),
  );

  // WIDGETS
  @override
  Widget build(BuildContext context) {
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);
    ViewNomineeLocalBloc viewNomineeLocalBloc =
        Provider.of<ViewNomineeLocalBloc>(context);
    return Scaffold(
      appBar: _screenAppBar,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 350.0,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
//        Background container behind contestant image
                Container(
                  width: double.infinity,
                  height: _bgContainerHeight,
                  decoration: BoxDecoration(
                    color: capitalVotesTheme().primaryColor,
                  ),
                ),
//        Contestant info  image && name && description
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Container(
                        width: _imgContainerWidth,
                        height: _imgContainerHeight,
                        decoration: _imgContainerDecoration,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(_imgContainerRadius),
                          child: Image(
                            fit: BoxFit.cover,
                            image: _contestantImg,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        _slctedContestantName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.5,
                        ),
                      ),
                      Text(_slctedContestantDesc,
                          style: TextStyle(fontSize: 11.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VoteFunctionWidget(),
        ],
      ),
    );
  }
}
