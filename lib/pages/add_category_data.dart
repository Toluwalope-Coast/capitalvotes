import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AddCategoryData extends StatefulWidget {
  final String categoryIndex;

  AddCategoryData({Key key, this.categoryIndex}) : super(key: key);

  @override
  _AddCategoryDataState createState() => _AddCategoryDataState();
}

class _AddCategoryDataState extends State<AddCategoryData> {
  final _formKey = GlobalKey<FormState>();


  _multiLineNav() => navigateToMultilineText(context, 'category');


  _save(contestBloc, localCategoryBlocState) {
    localCategoryBlocState.setCategoryIndex = int.parse(widget.categoryIndex);
    // instance of the category object
    CategoryBloc categoryBloc = new CategoryBloc();

    categoryBloc.categoryIndex = localCategoryBlocState.getCategoryIndex;
    categoryBloc.categoryBanner = localCategoryBlocState.getCategoryBanner;
    categoryBloc.categoryDescription = localCategoryBlocState.getCategoryDescription;
    categoryBloc.categoryName = localCategoryBlocState.getCategoryName;

    print('The category Index is: ${categoryBloc.categoryIndex}');
    print('The category Image string is: ${categoryBloc.categoryBanner}');
    print('The category Name is: ${categoryBloc.categoryName}');
    print('The category Description is: ${categoryBloc.categoryDescription}');
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      contestBloc.addCategoryList(categoryBloc);


      localCategoryBlocState.setCategoryIndex = null;

      localCategoryBlocState.setCategoryName = null;

      localCategoryBlocState.setCategoryDescription = null;

      localCategoryBlocState.setCategoryBanner = null;

      popGoTo(context,'/AddCategory');


    } else{

      Scaffold.of(context).showSnackBar(
          SnackBar(
              content:
              Text('Please add category image')));
    }
  }




  @override
  Widget build(BuildContext context) {

    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;


    ContestBloc contestBloc = Provider.of<ContestBloc>(context);
    LocalCategoryBlocState localCategoryBlocState = Provider.of<LocalCategoryBlocState>(context);


    return Scaffold(
        appBar: topAppBar2('New Category', context),
        backgroundColor: Colors.white,
        body: Builder(
            builder: (context) => ListView(children: <Widget>[
              InkWell(
                onTap: () {
                  navigateToImageCapture(context, 'add_category');
                },
                child: Container(
                  height: screenHeight * 0.30,
                  width: screenWidth,
                  color: Color(0Xee3D2960),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned(
                          bottom: screenHeight * 0.09,
                          left: screenWidth * 0.35,
                          child: Icon(
                            Icons.photo_library,
                            size: screenWidth * 0.20,
                            color: Color(0X99FFFFFF),
                          )),
                      Positioned.fill(
                          child: localCategoryBlocState.getCategoryBanner != null
                              ? Image.memory(stringToImageFile(localCategoryBlocState.getCategoryBanner), fit: BoxFit.cover,)
                              : Container(color: Colors.transparent)),
//                                  : Text('')),
                      Positioned(
                          bottom: screenHeight * 0.003,
                          right: 4.0,
                          child: FlatButton.icon(
                              padding: EdgeInsets.all(5.0),
                              color: Color(0x65E5306C),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              icon: Icon(Icons.photo_library,
                                  color: Colors.white, size: 16.0),
                              label: Text(localCategoryBlocState.getCategoryBanner == null ? 'Add Cover Picture' :  'Edit Cover Image' ,
                                  style: TextStyle(
                                      fontSize: 9.0,
                                      fontFamily: 'poppins',
                                      color: Colors.white))))
                    ],
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 20.0, left: 16.0, right: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Category Name',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Container(
                              height: screenHeight * 0.06,
                              padding: EdgeInsets.all(0.0),
                              child: TextFormField( textAlignVertical: TextAlignVertical.bottom,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 16.0),
                                initialValue: localCategoryBlocState.getCategoryName ?? '' ,
                                  autovalidate: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0X553D2960))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:  Color(0X553D2960))),
                                      hintText: 'Category Name',
                                      hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'poppins',
                                          color: Color(0X553D2960),
                                          fontStyle: FontStyle.italic),
                                      filled: true,
                                      fillColor: Colors.white),
                                  onChanged: (value) {
                                    localCategoryBlocState.setCategoryName = value;
                                  }
                              )),
                          SizedBox(height: 10.0),
                          Text(
                            'Category Description',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          InkWell(
                            onTap: _multiLineNav,
                            child: Container(
                              height: screenHeight * 0.06,
                              width: screenWidth,
                              padding: EdgeInsets.only(top: 4.0, right: 8.0, bottom: 0.0, left: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Color(0X553D2960)),
                                  color: Colors.white),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  localCategoryBlocState.getCategoryDescription ?? 'Contest Description',
                                  style:
                                  localCategoryBlocState.getCategoryDescription == null ?
                                  TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'poppins',
                                      fontStyle: FontStyle.italic,
                                      color: Color(0X553D2960))
                                      : TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.1),
                          Container(
                            width: screenWidth,
                            child: RaisedButton(
                              padding: EdgeInsets.only(top: screenWidth * 0.054, bottom: screenWidth * 0.054),
                                color:  localCategoryBlocState.getCategoryDescription != null &&
                                    localCategoryBlocState.getCategoryBanner != null &&
                                    localCategoryBlocState.getCategoryName != null
                                    ? Color(0xffE5306C)
                                    : Color(0x65E5306C),
                                onPressed: () {
                                  localCategoryBlocState.getCategoryName != null &&
                                      localCategoryBlocState.getCategoryBanner != null &&
                                      localCategoryBlocState.getCategoryDescription != null
                                      ? _save(contestBloc, localCategoryBlocState)
                                      : print('Not enabled');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(40)),
                                child: Text('Add',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button)),
                          )
                        ]),
                  ))
            ]))
    );

  }
}
