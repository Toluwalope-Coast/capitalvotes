import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/constants.dart';

class AddContest extends StatefulWidget {

  @override
  _AddContestState createState() => _AddContestState();
}

class _AddContestState extends State<AddContest> {
  final _formKey = GlobalKey<FormState>();
  bool _isCategory = false;
  bool _isPaidContest = false;

  // Receiving users inputs for processing
  final DateTime _selectedDate = DateTime.now();
  final TimeOfDay _selectedTime = TimeOfDay.now();


  _multiLineNav() => navigateToMultilineText(context, 'contest');


// Date picker

  Future<String> _pickDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (picked != null && picked != _selectedDate) {
      String outputDate = '${picked.year}/${picked.month}/${picked.day}';
      print('Date Selected:  $outputDate');
      return outputDate;
    } else {
      String outputDate =
          '${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}';
      print('Date Selected:  $outputDate');
      return outputDate;
    }
  }

// Time picker

  Future<String> _pickTime(BuildContext context) async {
    final TimeOfDay pickedTime =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (pickedTime != null && pickedTime != _selectedTime) {
      String stringTime = pickedTime.toString();
      String formattedTime = stringTime.substring(
          stringTime.indexOf('(') + 1, stringTime.indexOf(')'));

      print('Time Selected is $formattedTime');
      return formattedTime;
    } else {
      String stringTime = _selectedTime.toString();
      String formattedTime = stringTime.substring(
          stringTime.indexOf('(') + 1, stringTime.indexOf(')'));

      print('Time Selected is $formattedTime');
      return formattedTime;
    }
  }

// form text input

  bool _setCategory(category) {
    if (_isCategory != category) {
      print('Category Selected is $category');
      setState(() {
        _isCategory = category;
      });

      return category;
    } else {
      print('Category Selected is $category');
      return _isCategory;
    }
  }

  bool _setContestPaymentType(paymentType) {
    if (_isPaidContest != paymentType) {
      print('Paid For Selected is $paymentType');
      setState(() {
        _isPaidContest = paymentType;
      });
      return paymentType;
    } else {
      print('Paid For Selected is $_isPaidContest');
      return _isPaidContest;
    }
  }

  // The Save button

  _save(contestBloc) {
    print('The contest Image string is: ${contestBloc.getContestBanner}');
    print('The contest Name is: ${contestBloc.getContestName}');
    print('The contest Description is: ${contestBloc.getContestDescription}');
    print('The contest Start Time is: ${contestBloc.getStartTime}');
    print('The contest End Time is: ${contestBloc.getEndTime}');
    print('The contest Start Date is: ${contestBloc.getStartDate}');
    print('The contest End Date is: ${contestBloc.getEndDate}');
    print('The contest is a category: ${contestBloc.getIsCategory}');
    print('The contest is paid For: ${contestBloc.getIsPaidFor}');
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      if (contestBloc.getIsCategory == false) {
        pushGoTo(context, '/ConfirmContest');
      } else {
        pushGoTo(context, '/AddCategory');
      }
//
//                                        Scaffold.of(context).showSnackBar(
//                                            SnackBar(
//                                                content:
//                                                    Text('Processing Data')));
    }
  }

  // Assigning Variable for getting form inputs


  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    _startTime() =>  _pickTime(context).then((String formattedTime) => contestBloc.setStartTime = formattedTime);
    _endTime() =>  _pickTime(context).then((String formattedTime) => contestBloc.setEndTime = formattedTime);
    _startDate() =>  _pickDate(context).then((String formattedTime) => contestBloc.setStartDate = formattedTime);
    _endDate() =>  _pickDate(context).then((String formattedTime) => contestBloc.setEndDate = formattedTime);


    return Scaffold(
        appBar: topAppBar2('Create Contest', context),
        backgroundColor: Colors.white,
        body: Builder(
            builder: (context) => ListView(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      navigateToImageCapture(context, 'add_contest');
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
                              child: contestBloc.getContestBanner != null
                                  ? Image.memory(stringToImageFile(contestBloc.getContestBanner), fit: BoxFit.cover,)
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
                                  label: Text(contestBloc.getContestBanner == null ? 'Add Cover Picture' :  'Edit Cover Image' ,
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
                            top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Contest Name',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Container(
                                  height: screenHeight * 0.06,
                                  padding: EdgeInsets.all(0.0),
                                  child: TextFormField( textAlignVertical: TextAlignVertical.bottom,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16.0),
                                      initialValue: contestBloc.getContestName == null ? '' : contestBloc.getContestName,
                                      autovalidate: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0X553D2960))),
                                          hintText: 'Contest Name',
                                          hintStyle: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'poppins',
                                              color: Color(0X553D2960),
                                              fontStyle: FontStyle.italic),
                                          filled: true,
                                          fillColor: Colors.white),
                                      onChanged: (value) =>
                                          contestBloc.setContestName = value)),
                              SizedBox(height: 10.0),
                              Text(
                                'Contest Description',
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
                                            contestBloc.getContestDescription ==
                                                    null
                                                ? 'Contest Description'
                                                : contestBloc.getContestDescription,
                                            style:
                                                contestBloc.getContestDescription ==
                                                        null
                                                    ? TextStyle(
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
                              SizedBox(height: 10.0),
                              Text(
                                'Duration',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: _startTime,
                                    child: Container(
                                      width: screenWidth * 0.36,
                                      height: screenHeight * 0.06,
                                      padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0.0, left: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: Color(0X553D2960)),
                                          color: Colors.white),
                                          child: Text(
                                            contestBloc.getStartTime == null
                                                ? 'Start Time'
                                                : contestBloc.getStartTime,
                                            style: contestBloc.getStartTime ==
                                                    null
                                                ? TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontStyle: FontStyle.italic,
                                                    color: Color(0X553D2960))
                                                : TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black, letterSpacing: 2.0),
                                            textAlign: TextAlign.left,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: _endTime,
                                    child: Container(
                                      width: screenWidth * 0.36,
                                      height: screenHeight * 0.06,
                                      padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0.0, left: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: Color(0X553D2960)),
                                          color: Colors.white),
                                      child: Text(
                                            contestBloc.getEndTime == null
                                                ? 'End Time'
                                                : contestBloc.getEndTime,
                                            style: contestBloc.getEndTime ==
                                                    null
                                                ? TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontStyle: FontStyle.italic,
                                                    color: Color(0X553D2960))
                                                : TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: 'poppins',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black, letterSpacing: 2.0),
                                        textAlign: TextAlign.left,
                                          ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: _startDate,
                                    child: Container(
                                      width: screenWidth * 0.36,
                                      height: screenHeight * 0.06,
                                      padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0.0, left: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: Color(0X553D2960)),
                                          color: Colors.white),
                                      child: Text(
                                            contestBloc.getStartDate == null
                                                ? 'Start Date'
                                                : contestBloc.getStartDate,
                                            style: contestBloc.getStartDate ==
                                                    null
                                                ? TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontStyle: FontStyle.italic,
                                                    color: Color(0X553D2960))
                                                : TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black87,),
                                        textAlign: TextAlign.left,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: _endDate,
                                    child: Container(
                                      width: screenWidth * 0.36,
                                      height: screenHeight * 0.06,
                                      padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0.0, left: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: Color(0X553D2960)),
                                          color: Colors.white),
                                      child: Text(
                                            contestBloc.getEndDate == null
                                                ? 'End Date'
                                                : contestBloc.getEndDate,
                                            style: contestBloc.getEndDate ==
                                                    null
                                                ? TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontStyle: FontStyle.italic,
                                                    color: Color(0X553D2960))
                                                : TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black87,),
                                            textAlign: TextAlign.left,
                                          ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: screenHeight * 0.06,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                        '(*) is this a contest with categories ?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    Switch(
                                      value: _isCategory,
                                      onChanged: (bool value) {
                                        contestBloc.setIsCategory =
                                            _setCategory(value);
                                      },
                                      activeColor: Color(0xffE5306C),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.06,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('(*) is this a paid contest ?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    Switch(
                                      value: _isPaidContest,
                                      onChanged: (bool value) {
                                        contestBloc.setIsPaidFor =
                                            _setContestPaymentType(value);
                                      },
                                      activeColor: Color(0xffE5306C),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                width: screenWidth,
                                child: RaisedButton(
                                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02,),
                                    color: contestBloc.getContestName != null &&
                                        contestBloc.getContestBanner != null &&
                                            contestBloc.getStartTime != null &&
                                        contestBloc.getEndTime != null &&
                                        contestBloc.getStartDate != null &&
                                        contestBloc.getEndDate != null
                                        ? Color(0xffE5306C)
                                        : Color(0x65E5306C),
                                    onPressed: () {
                                      contestBloc.getContestName != null &&
                                          contestBloc.getContestBanner != null &&
                                          contestBloc.getContestDescription != null &&
                                          contestBloc.getStartTime != null &&
                                          contestBloc.getEndTime != null &&
                                          contestBloc.getStartDate != null &&
                                          contestBloc.getEndDate != null
                                          ? _save(contestBloc)
                                          : print('Not enabled');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Text('Next',
                                        style: Theme.of(context)
                                            .textTheme
                                            .button)),
                              )
                            ]),
                      ))
                ])));
  }
}
