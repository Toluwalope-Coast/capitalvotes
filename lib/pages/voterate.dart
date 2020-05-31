import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/pages/confirm_contest.dart';
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

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    return Scaffold(
      appBar: topAppBar2('Set Minimum Balance', context),
      backgroundColor: Color(0xffe2e0e5),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        children: <Widget>[
          Center(child: Text('Set Cost Per Vote')),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.20,
                  color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
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
                    onChanged: (Country currency) {
                      setState(() {
                        _selected = currency;
                      });
                    },
                    selectedCountry: _selected,
                  )),
              Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.30,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        labelText: 'NGN 50',
                        labelStyle: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'poppins',
                            color: Color(0X553D2960),
                            fontStyle: FontStyle.italic),
                        filled: true,
                        fillColor: Colors.white),
                      onChanged: (value) =>
                      contestBloc.setVoteRate = double.parse(value)
                  )),
            ],
          ),
          SizedBox(height: screenHeight * 0.40),
          Container(
            width: screenWidth,
            child: RaisedButton(
                onPressed: () {
                  // the saving the data to share preferences

                  contestBloc.setCurrencyType = _selected.toString();

                  print('The Currency selected is: ${contestBloc.getCurrencyType}');
                  print('The vote rate is: ${contestBloc.getVoteRate}');
                  pushGoTo(context, ConfirmContest());
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text('Done', style: Theme.of(context).textTheme.button)),
          )
        ],
      ),
    );
  }
}
