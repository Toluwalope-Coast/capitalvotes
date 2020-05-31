import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/pages/add_category_data.dart';
import 'package:capitalvotes/pages/update_category_data.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
import 'package:capitalvotes/pages/confirm_contest.dart';
import 'package:capitalvotes/pages/voterate.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  _deleteCategory(category, contestBloc) {
    contestBloc.removeCategoryFromContest(category);
    print('The delete is: $category');
    popGoTo(context, AddCategory());
  }

  _updateCategory(category, localCategoryUpdateBlocState, contestBloc) {
    localCategoryUpdateBlocState.setCategoryIndex =
        contestBloc.contestCategoryList.indexOf(category);
    localCategoryUpdateBlocState.setCategoryName =
        category.categoryName;
    localCategoryUpdateBlocState.setCategoryDescription =
        category.categoryDescription;
    localCategoryUpdateBlocState.setCategoryBanner =
        category.categoryBanner;

    print('The update is: $category');
    print('The category index to update is: ${contestBloc.contestCategoryList.indexOf(category)}');

    popGoTo(context, UpdateCategoryData());
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    LocalCategoryUpdateBlocState localCategoryUpdateBlocState =
        Provider.of<LocalCategoryUpdateBlocState>(context);

    _optionMenu(BuildContext context, index) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    alignment: Alignment.bottomLeft,
                    color: Colors.white70,
                    child: FlatButton(
                      splashColor: Color(0xffE5306C),
                      onPressed: () {
                        _updateCategory(
                            index, localCategoryUpdateBlocState, contestBloc);
                        print('The Index Value of : $index');
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'poppins',
                            color:  Color(0xffE5306C))
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    alignment: Alignment.bottomLeft,
                    color: Colors.white70,
                    child: FlatButton(
                      splashColor: Color(0xffE5306C),
                      onPressed: () {
                        _deleteCategory(index, contestBloc);
                        print('The Index Value of : $index');
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: topAppBar2('Add Category', context),
      backgroundColor: Color(0xffe2e0e5),
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: screenWidth,
                height: screenHeight * 0.06,
                child: FlatButton.icon(
                    color: Color(0xffE5306C),
                    onPressed: () {
                      print(contestBloc.contestCategoryList.length);
                      contestBloc.contestCategoryList.isNotEmpty;

                      pushGoTo(context, AddCategoryData());
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: Text(
                      'ADD CATEGORY',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: Colors.white),
                    )),
              ),
              SizedBox(height: 20.0),
              Divider(color: Colors.black12),
              Expanded(
                  child: ListView.builder(
                      itemCount: contestBloc.contestCategoryList.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black38))),
                        child: ListTile(
                              title: Text(
                                '${contestBloc.contestCategoryList[index].categoryName}',
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                )
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  _optionMenu(context,
                                      contestBloc.contestCategoryList[index]);
                                  print('Option Priced');
                                },
                                icon: Icon(Icons.more_vert,
                                    color: Color(0xffE5306C)),
                              ),
                            ),
                      ))),
              SizedBox(height: 10.0),
              contestBloc.contestCategoryList.length < 1
                  ? Container(height: 0.0, width: 0.0)
                  : Container(
                      width: screenWidth,
                      child: RaisedButton(
                          onPressed: () {
                            if (contestBloc.getIsPaidFor == false &&
                                contestBloc.contestCategoryList.length > 0) {
                              pushGoTo(context, ConfirmContest());
                            } else if (contestBloc.getIsPaidFor == true &&
                                contestBloc.contestCategoryList.length > 0) {
                              pushGoTo(context, VoteRate());
                            } else {
                              print('Not enabled');
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text('Next',
                              style: Theme.of(context).textTheme.button)))
            ],
          ),
        ),
      ),
    );
  }
}
