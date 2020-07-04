import 'package:capitalvotes/shared/theme.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferToBankScreen extends StatefulWidget {
  @override
  _TransferToBankScreenState createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          'Transfer to Bank',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: screenWidth,
                height: screenWidth * 0.95,
                decoration: BoxDecoration(
                  color: capitalVotesTheme().primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(67.0),
                  ),
                ),
              ),
//              MAIN CONTAINER
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.76,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x323D2960),
                        offset: Offset(0, 5),
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                  // CONTENT ON MAIN CONTAINER
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Bank name',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Account number',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
//                        DropdownButtonFormField(
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            contentPadding: EdgeInsets.zero,
//                            isDense: true,
//                          ),
////                          value: _monthValue,
//                          isExpanded: false,
//                          elevation: 2,
//                          icon: Icon(Icons.expand_more),
//                          iconSize: 18.0,
//                          iconEnabledColor: capitalVotesTheme().primaryColor,
//                          onChanged: (newValue) {
////                            setState(() {
////                              _monthValue = newValue;
////                            });
//                          },
////                          items: monthsInAYear.map((month) {
////                            return DropdownMenuItem(
////                              value: month,
////                              child: SizedBox(
////                                child: Text(
////                                  month.monthName.toUpperCase(),
////                                  style: TextStyle(
////                                    fontSize: 14.0,
////                                    color: capitalVotesTheme()
////                                        .primaryColor,
////                                  ),
////                                ),
////                              ),
////                            );
////                          }).toList(),
//                        ),
                        TextFormField(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter account number',
                            contentPadding: EdgeInsets.fromLTRB(
                              15.0,
                              16.0,
                              20.0,
                              16.0,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            focusedBorder: formBorderFocused.copyWith(
                              borderRadius: BorderRadius.zero,
                            ),
                            errorBorder: formBorderError,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Amount',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            hintText: '0',
                            contentPadding: EdgeInsets.fromLTRB(
                              15.0,
                              16.0,
                              20.0,
                              16.0,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            focusedBorder: formBorderFocused.copyWith(
                              borderRadius: BorderRadius.zero,
                            ),
                            errorBorder: formBorderError,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Message (optional)',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Enter message',
                            contentPadding: EdgeInsets.fromLTRB(
                              15.0,
                              16.0,
                              20.0,
                              16.0,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            focusedBorder: formBorderFocused.copyWith(
                              borderRadius: BorderRadius.zero,
                            ),
                            errorBorder: formBorderError,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 24.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)),
                                textColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 100.0,
                                ),
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
//          TOTAL EARNING SECTION
          Container(
            width: screenWidth,
            margin: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 6.0),
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20.0)],
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                totalEarningsWidget(
                  'Total Earning',
                  '48,000',
                  true,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                totalEarningsWidget(
                  'Total Withdrawal',
                  '30,000',
                  false,
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
        ],
      ),
    );
  }

  Widget totalEarningsWidget(String title, String earnings, bool earningGain) {
    TextStyle _txtStyle = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(child: Text(title, style: _txtStyle)),
        Icon(
          earningGain ? Icons.arrow_upward : Icons.arrow_downward,
          color: earningGain ? Colors.greenAccent : Colors.redAccent,
          size: 12.0,
        ),
        Expanded(
          child: Text(
            "N" + earnings + ".00",
            style: _txtStyle.copyWith(
              color: earningGain ? Colors.greenAccent : Colors.redAccent,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
