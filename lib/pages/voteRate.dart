import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:provider/provider.dart';

class VoteRate extends StatefulWidget {
  @override
  _VoteRateState createState() => _VoteRateState();
}

class _VoteRateState extends State<VoteRate> {
  Country _selected;

  _save(contestBloc) {
    contestBloc.setCurrencyType = _selected.name;

    print('The Currency selected is: ${contestBloc.getCurrencyType}');
    print('The vote rate is: ${contestBloc.getVoteRate}');
    pushGoTo(context, '/ConfirmContest');
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    return Scaffold(
      appBar: topAppBar2('Vote Cost', context),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        children: <Widget>[
          Center(
              child: Text(
            'Set Cost Per Vote',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 4.0),
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0X553D2960)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ],
                      color: Colors.white),
                  child: CountryPicker(
                    dense: false,
                    showFlag: false,
                    //displays flag, true by default
                    showDialingCode: false,
                    //displays dialing code, false by default
                    showName: false,
                    //displays country name, true by default
                    showCurrency: false,
                    //eg. 'British pound'
                    showCurrencyISO: true,
                    //eg. 'GBP'
                    currencyISOTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500),
                    onChanged: (Country currency) {
                      setState(() {
                        _selected = currency;
                      });
                    },
                    selectedCountry: _selected,
                  )),
              SizedBox(width: 4.0),
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0X553D2960)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ],
                      color: Colors.white),
                  child: TextFormField(
                      style: TextStyle(fontSize: 16.0),
                      autovalidate: true,
                      initialValue: contestBloc.getVoteRate == null
                          ? ''
                          : contestBloc.getVoteRate.toString(),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white),
                      onChanged: (value) =>
                          contestBloc.setVoteRate = double.parse(value)))
            ],
          ),
          SizedBox(height: screenHeight * 0.25),
          Container(
            width: screenWidth,
            child: RaisedButton(
                color: contestBloc.getVoteRate != null
                    ? Color(0xffE5306C)
                    : Color(0x65E5306C),
                padding: EdgeInsets.only(
                    top: screenWidth * 0.054, bottom: screenWidth * 0.054),
                onPressed: () {
                  contestBloc.getVoteRate != null
                      ? _save(contestBloc)
                      : print('No Action');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text('Next', style: Theme.of(context).textTheme.button)),
          )
        ],
      ),
    );
  }
}
