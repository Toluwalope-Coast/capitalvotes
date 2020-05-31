import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/add_contest.dart';
import 'package:capitalvotes/pages/update_category_data.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/pages/profile_edit.dart';
import 'package:capitalvotes/pages/add_category_data.dart';
import 'package:capitalvotes/pages/add_nominee_with_category.dart';
import 'package:capitalvotes/pages/add_nominee_without_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiLineTextField extends StatefulWidget {
  final String location;
  final String existingValue;

  MultiLineTextField({Key key, this.location, this.existingValue}) : super(key: key);

  @override
  _MultiLineTextFieldState createState() => _MultiLineTextFieldState();
}


class _MultiLineTextFieldState extends State<MultiLineTextField> {


  String _multilineTextFieldValue;

  @override
  Widget build(BuildContext context) {

//    CategoryBloc categoryBloc = Provider.of<CategoryBloc>(context);

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);
    LocalCategoryBlocState localCategoryBlocState = Provider.of<LocalCategoryBlocState>(context);
    LocalCategoryUpdateBlocState localCategoryUpdateBlocState =
    Provider.of<LocalCategoryUpdateBlocState>(context);


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          widget.location == 'contest' || widget.location == 'category' || widget.location == 'updateCategory'  ? 'Description' : 'Bio',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Color(0xffe2e0e5),
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            color: Colors.transparent,
            padding: EdgeInsets.only(right: 16.0),
            icon: Icon(Icons.check, color: _multilineTextFieldValue == null ? Color(0x88E5306C): Color(0xffE5306C), size: 25.0),
            onPressed: () {
              if (_multilineTextFieldValue != null) {
                switch(widget.location) {
                  case 'contest':
                    contestBloc.setContestDescription = _multilineTextFieldValue;
                    popGoTo(context, AddContest());
                    break;
                  case 'profile':
                    userProfileBloc.setBio = _multilineTextFieldValue;
                    popGoTo(context, ProfileEdit());
                    break;
                  case 'category':
                    localCategoryBlocState.setCategoryDescription = _multilineTextFieldValue;
                    popGoTo(context, AddCategoryData());
                    break;
                  case 'updateCategory':
                    localCategoryUpdateBlocState.setCategoryDescription = _multilineTextFieldValue;
                    popGoTo(context, UpdateCategoryData());
                    break;
                  case 'nomineewithcategory':
                    contestBloc.setContestDescription = _multilineTextFieldValue;
                    replaceGoTo(context, AddNomineeWithCategory());
                    break;
                  case 'nomineewithoutcategory':
                    contestBloc.setContestDescription = _multilineTextFieldValue;
                    popGoTo(context, AddNomineeWithOutCategory());
                    break;
                }}

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
              print('This is the setState multilinetext $_multilineTextFieldValue');
            });
          },),
      ),
    );
  }
}
