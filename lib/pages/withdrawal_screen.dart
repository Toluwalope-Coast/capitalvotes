import 'package:capitalvotes/pages/transfer_to_bank_screen.dart';
import 'package:capitalvotes/shared/chart_util.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WithdrawalScreen extends StatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          'Withdrawal',
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
                height: screenWidth * 0.75,
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
                  height: screenHeight * 0.66,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
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
                  child: Column(
                    children: <Widget>[
                      optionWidget(
                        title: 'Transfer to Bank',
                        onTap: () {
                          pushGoTo(context, '/TransferToBankScreen');
                        },
                      ),
                      optionWidget(
                        title: 'Transfer money to other banks',
                        onTap: () {},
                      ),
                      optionWidget(
                        title: 'Transfer to Wallet',
                        onTap: () {},
                      )
                    ],
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
}

Widget optionWidget({String title, VoidCallback onTap}) {
  double _borderWidth = 1.0;
  Color _borderColor = Color(0x22707070);
  Color _shadowColor = Color(0x11000000);
  String _imgAssetPath = 'images/payment_icons/bank_icon.png';
  Image _optionWidgetImg = Image.asset(_imgAssetPath, fit: BoxFit.cover);
  BoxBorder _optionWidgetBorder = Border.all(
    width: _borderWidth,
    color: _borderColor,
  );
  List<BoxShadow> _optionWidgetShadow = [
    BoxShadow(color: _shadowColor, offset: Offset(0, 3), blurRadius: 6.0)
  ];
  TextStyle _optionTxtStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

  return Padding(
    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 18.0),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: _optionWidgetBorder,
        boxShadow: _optionWidgetShadow,
      ),
      child: ListTile(
        leading: ClipOval(child: _optionWidgetImg),
        title: Text(title, style: _optionTxtStyle),
        onTap: onTap,
        dense: false,
        enabled: true,
      ),
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
