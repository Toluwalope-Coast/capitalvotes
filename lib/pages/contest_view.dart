import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/nominee_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:provider/provider.dart';

class CreatorContestView extends StatefulWidget {
  @override
  _CreatorContestViewState createState() => _CreatorContestViewState();
}

class _CreatorContestViewState extends State<CreatorContestView> {
  List<NomineeBloc> categoryNominee = [];

  _gotoCategoryNomineePage(index){
    print('gotoCategoryNomineePage Pressed');
  }

  _gotoNonCategoryNomineePage(index){
    print('gotoNonCategoryNomineePage Pressed');
  }

  _categorySelected(index){
    print('categorySelected pressed');
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    for (int i = 0; i < contestBloc.contestCategoryList.length; i++) {
      for (int j = 0;
          j < contestBloc.contestCategoryList[i].nomineesList.length;
          j++) {
        categoryNominee.add(contestBloc.contestCategoryList[i].nomineesList[j]);
      }
    }

    return Scaffold(
      appBar: topAppBar('Contest View'),
      body: ListView(
        children: <Widget>[
          Container(
              height: screenHeight * 0.30,
              width: screenWidth,
              color: Color(0Xee3D2960),
              child: Stack(overflow: Overflow.visible, children: <Widget>[
                Positioned.fill(
                    child: Image.memory(
                  stringToImageFile(contestBloc.getContestBanner),
                  fit: BoxFit.cover,
                )),
                Positioned(
                    bottom: -(screenHeight * 0.04),
                    left: screenWidth * 0.36,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      child: ClipOval(
                          child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: Image.asset(
                                'images/logo.png',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.25,
                                width: screenWidth,
                              ))),
//
                    ))
              ])),
          SizedBox(height: screenHeight * 0.04),
          Center(
            widthFactor: screenWidth * 0.6,
            child: Column(
              children: <Widget>[
                Text(
                  contestBloc.getContestName != null
                      ? contestBloc.getContestName
                      : 'Contest Name',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      color: Color(0Xff2e2d2d),
                      fontWeight: FontWeight.bold),
                ),
                contestBloc.getContestDescription != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          contestBloc.getContestDescription,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 12,
                              color: Color(0Xff2e2d2d)),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(height: 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.alarm,
                      color: Color(0xffE5306C),
                      size: 12,
                    ),
                    Text('Votes ends ',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C))),
                    Text(
                        contestBloc.getEndDate != null
                            ? contestBloc.getEndDate
                            : 'September 23',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0xffE5306C),
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          contestBloc.getIsCategory == false
              ? Container(
                  width: screenWidth,
                  height: screenHeight * 0.06,
                  color: Color(0xffE5306C),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'All Nominees',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                  width: screenWidth,
                  height: screenHeight * 0.06,
                  constraints: BoxConstraints.expand(
                      width: screenWidth, height: screenHeight * 0.06),
                  color: Color(0xffE5306C),
                  child: DropdownButton<CategoryBloc>(
                      isExpanded: true,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      underline: SizedBox(height: 0.0, width: 0.0),
                      style: TextStyle(color: Colors.white),
                      hint: Text('All Category',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500)),
                      dropdownColor: Colors.black,
                      items: contestBloc.contestCategoryList
                          .map((CategoryBloc category) => DropdownMenuItem<
                                  CategoryBloc>(
                              value: category,
                              child: InkWell(
                                onTap: _categorySelected(category.categoryIndex),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                        backgroundColor: Color(0xffE5306C),
                                        radius: screenHeight * 0.032,
                                        child: ClipOval(
                                            child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    color: Colors.white,
                                                    child: Text(
                                                        '${category.nomineesList.length}',
                                                        style: TextStyle(
                                                            color:
                                                                Color(0xffE5306C),
                                                            fontWeight: FontWeight
                                                                .w500)))))),
                                    SizedBox(width: 6),
                                    Text('${category.categoryName}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              )))
                          .toList(),
                      onChanged: (CategoryBloc category) {
                        contestBloc.setContestCategoryIndex =
                            contestBloc.contestCategoryList.indexOf(category);
                        print(
                            'The category Name selected is: ${contestBloc.contestCategoryList[contestBloc.getContestCategoryIndex].categoryName}');
                        print(
                            'The category index selected is: ${contestBloc.getContestCategoryIndex}');
                      }),
                ),
          Container(
              color: Colors.white,
              height: screenHeight * 0.7,
              width: screenWidth,
              child: contestBloc.getIsCategory == true
                  ? GridView.builder(
                      itemCount: categoryNominee.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: _gotoCategoryNomineePage(categoryNominee[index].nomineeContestCategoryIndex),
                          child: Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              child: GridTile(
                                footer:
                                    Text(categoryNominee[index].nomineeName),
                                child: Image.memory(
                                  stringToImageFile(categoryNominee[index]
                                      .nomineeImage), //just for testing, will fill with image later
                                ),
                              )),
                        );
                      },
                    )
                  : GridView.builder(
                      itemCount: contestBloc.nomineeWithOutCategoryList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          //pushGoTo(context, '/VoteScreen')
                          onTap: _gotoNonCategoryNomineePage(contestBloc.nomineeWithOutCategoryList[index]),
                          child: Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              child: GridTile(
                                footer: Text(contestBloc
                                    .nomineeWithOutCategoryList[index]
                                    .nomineeName),
                                child: Image.memory(
                                  stringToImageFile(contestBloc
                                      .nomineeWithOutCategoryList[index]
                                      .nomineeImage), //just for testing, will fill with image later
                                ),
                              )),
                        );
                      },
                    ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushGoTo(context, '/AddNominee');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xffE5306C),
      ),
    );
  }
}
