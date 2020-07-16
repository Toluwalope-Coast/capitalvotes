import 'package:capitalvotes/shared/chart_util.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EarningsScreen extends StatefulWidget {
  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _monthValue;

  @override
  void initState() {
    super.initState();
    _monthValue = monthsInAYear[0];
//    initialize tab controller for switch between graph
    _tabController = TabController(vsync: this, length: 2);
  }

  // dispose controller when not in use
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          'My Earning',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            offset: Offset(0.0, 12.0),
            itemBuilder: ((BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: FlatButton(
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ];
            }),
          ),
        ],
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.66,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
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
                  child: Column(
                    children: <Widget>[
                      earningBalanceWidget(),
                      Divider(),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
//                            TAB BAR HEADER / STATS
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      'Stats',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 90.0,
                                    child: TabBar(
                                      controller: _tabController,
                                      indicatorColor: Colors.transparent,
                                      labelPadding: EdgeInsets.zero,
                                      indicatorPadding: EdgeInsets.zero,
                                      labelColor:
                                          capitalVotesTheme().primaryColor,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      unselectedLabelColor: capitalVotesTheme()
                                          .secondaryHeaderColor,
                                      unselectedLabelStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      tabs: [
                                        Tab(
                                          text: 'Weeks',
                                        ),
                                        Tab(
                                          text: 'Days',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
//                            DROP DOWN BTN
                            SizedBox(
                              width: 100.0,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: Colors.white,
                                ),
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                  ),
                                  value: _monthValue,
                                  isExpanded: false,
                                  elevation: 2,
                                  icon: Icon(Icons.expand_more),
                                  iconSize: 18.0,
                                  iconEnabledColor:
                                      capitalVotesTheme().primaryColor,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _monthValue = newValue;
                                    });
                                  },
                                  items: monthsInAYear.map((month) {
                                    return DropdownMenuItem(
                                      value: month,
                                      child: SizedBox(
                                        child: Text(
                                          month.monthName.toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: capitalVotesTheme()
                                                .primaryColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
//                      TAB BAR VIEW / GRAPH
                      Container(
                        height: 220.0,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Container(
                              child: CustomLineChart(),
                            ),
                            Container(),
                          ],
                        ),
                      ),
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
//          TODO complete screen
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget earningBalanceWidget() {
    String _headingText = 'Balance';
    String _buttonText = 'Withdraw';
    String _amount = '18,000';

    // TODO make component reusable

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _headingText,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: capitalVotesTheme().primaryColor,
                      ),
                    ),
                    Text(
                      'N' + _amount + '.00',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 76.0,
              height: 27.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0)),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  _buttonText,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  pushGoTo(context, '/WithdrawalScreen');
                },
              ),
            ),
          ],
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
}

var dateTime = DateTime.now();
var monthNameDateFormat = DateFormat.MMMM().format(dateTime);

class Month {
  String monthName;
  String monthIndex;
  Month(this.monthName);
}

List monthsInAYear = [
  Month("January"),
  Month("February"),
  Month("March"),
  Month("April"),
  Month("May"),
  Month("June"),
  Month("July"),
  Month("August"),
  Month("September"),
  Month("October"),
  Month("November"),
  Month("December"),
];
