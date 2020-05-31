import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
import 'package:capitalvotes/services/nominee_with_category_local_state.dart';
import 'package:capitalvotes/services/nominee_with_category_update_local_state.dart';
import 'package:capitalvotes/services/nominee_without_category_local_state.dart';
import 'package:capitalvotes/services/nominee_without_category_update_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiLineTextField extends StatefulWidget {
  final String location;
  final String existingValue;

  MultiLineTextField({Key key, this.location, this.existingValue})
      : super(key: key);

  @override
  _MultiLineTextFieldState createState() => _MultiLineTextFieldState();
}

class _MultiLineTextFieldState extends State<MultiLineTextField> {
  String _multilineTextFieldValue;

  @override
  Widget build(BuildContext context) {

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);
    LocalCategoryBlocState localCategoryBlocState =
        Provider.of<LocalCategoryBlocState>(context);
    LocalCategoryUpdateBlocState localCategoryUpdateBlocState =
        Provider.of<LocalCategoryUpdateBlocState>(context);
    LocalNomineeWithCategoryBlocState localNomineeWithCategoryBlocState =
        Provider.of<LocalNomineeWithCategoryBlocState>(context);
    LocalUpdateNomineeWithCategoryBlocState localUpdateNomineeWithCategoryBlocState =
    Provider.of<LocalUpdateNomineeWithCategoryBlocState>(context);
    LocalNomineeWithoutCategoryBlocState localNomineeWithoutCategoryBlocState =
        Provider.of<LocalNomineeWithoutCategoryBlocState>(context);
    LocalNomineeWithoutUpdateBlocState localNomineeWithoutUpdateBlocState =
    Provider.of<LocalNomineeWithoutUpdateBlocState>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          widget.location == 'contest' ||
                  widget.location == 'category' ||
                  widget.location == 'updateCategory'
              ? 'Description'
              : 'Bio',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Color(0xffe2e0e5),
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            color: Colors.transparent,
            padding: EdgeInsets.only(right: 16.0),
            icon: Icon(Icons.check,
                color: _multilineTextFieldValue == null
                    ? Color(0x88E5306C)
                    : Color(0xffE5306C),
                size: 25.0),
            onPressed: () {
              if (_multilineTextFieldValue != null) {
                switch (widget.location) {
                  case 'contest':
                    contestBloc.setContestDescription =
                        _multilineTextFieldValue;
                    popGoTo(context, '/AddContest');
                    break;
                  case 'profile':
                    userProfileBloc.setBio = _multilineTextFieldValue;
                    popGoTo(context, '/EditProfile');
                    break;
                  case 'category':
                    localCategoryBlocState.setCategoryDescription =
                        _multilineTextFieldValue;
                    popGoTo(context, '/AddCategoryData');
                    break;
                  case 'updateCategory':
                    localCategoryUpdateBlocState.setCategoryDescription =
                        _multilineTextFieldValue;
                    popGoTo(context, '/UpdateCategoryData');
                    break;
                  case 'nomineeWithCategory':
                    localNomineeWithCategoryBlocState.setNomineeBio =
                        _multilineTextFieldValue;
                    popGoTo(context, '/AddNomineeWithCategory');
                    break;
                  case 'updateNomineeWithCategory':
                    localUpdateNomineeWithCategoryBlocState.setNomineeBio =
                        _multilineTextFieldValue;
                    popGoTo(context, '/UpdateNomineeWithCategory');
                    break;
                  case 'nomineeWithoutCategory':
                    localNomineeWithoutCategoryBlocState.setNomineeBio =
                        _multilineTextFieldValue;
                    popGoTo(context, '/AddNomineeWithOutCategory');
                    break;
                  case 'updateNomineeWithoutCategory':
                    localNomineeWithoutUpdateBlocState.setNomineeBio =
                        _multilineTextFieldValue;
                    popGoTo(context, '/UpdateNomineeWithOutCategory');
                    break;
                }
              }
            },
          )
        ],
      ),
      backgroundColor: Color(0xffe2e0e5),
      body: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: TextFormField(
          autofocus: true,
          maxLength: 150,
          maxLengthEnforced: true,
          maxLines: 20,
          style: TextStyle(
            fontSize: 16.0,
          ),
          autovalidate: true,
          keyboardType: TextInputType.multiline,
          initialValue: widget.existingValue ?? '',
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30)),
              filled: true,
              fillColor: Colors.white),
          onChanged: (String value) {
            setState(() {
              _multilineTextFieldValue = value;
              print(
                  'This is the setState multilinetext $_multilineTextFieldValue');
            });
          },
        ),
      ),
    );
  }
}
