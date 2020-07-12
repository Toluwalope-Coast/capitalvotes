import 'package:capitalvotes/pages/withdrawal_screen.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/bank_list_for_transfer_screen.dart';

class TransferToBankScreen extends StatefulWidget {
  @override
  _TransferToBankScreenState createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  String bankCode;

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
                  height: screenHeight * 0.8,
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
                        optionWidget(
                          title: 'Select bank for transfer',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BankListScreen()),
                            );
                          },
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
          SizedBox(
            height: screenHeight * 0.1,
          ),
        ],
      ),
    );
  }
}
