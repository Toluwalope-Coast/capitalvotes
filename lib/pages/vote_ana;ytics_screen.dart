import 'package:capitalvotes/pages/analytics_widget.dart';
import 'package:capitalvotes/shared/capital_vote_icons_icons.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteAnalyticScreen extends StatefulWidget {
  @override
  _VoteAnalyticScreenState createState() => _VoteAnalyticScreenState();
}

class _VoteAnalyticScreenState extends State<VoteAnalyticScreen> {
  TextStyle _headingTxtStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );
  TextStyle _cardTxtStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
  );
  bool expansionTileOpen = false;
  _setOpenState(bool trigger) {
    if (trigger == true) {
      expansionTileOpen = trigger;
      print(trigger);
    } else if (trigger == false) {
      expansionTileOpen = trigger;
      print(trigger);
    }
  }

  @override
  void initState() {
    super.initState();
    expansionTileOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    Widget _screenAppbar = AppBar(
      automaticallyImplyLeading: true,
      title: Text(
        'Vote Analytic',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
      titleSpacing: 2.0,
      actions: <Widget>[
        IconButton(
          iconSize: 26.0,
          color: Colors.white,
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );
    return Scaffold(
      appBar: _screenAppbar,
      body: ListView(
        padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'MMG 2020 Awards',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 18.0),
                  decoration: BoxDecoration(
                    color: expansionTileOpen
                        ? capitalVotesTheme().primaryColor
                        : Colors.white,
                    boxShadow: expansionTileOpen
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset(0, 2),
                              blurRadius: 2.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (bool trigger) {
                      setState(() {
                        if (trigger == true) {
                          expansionTileOpen = trigger;
                          print(trigger);
                        } else if (trigger == false) {
                          expansionTileOpen = trigger;
                          print(trigger);
                        }
                      });
                    },
                    title: Text(
                      'Best African Artist Of The Year',
                      style: expansionTileOpen
                          ? _headingTxtStyle.copyWith(color: Colors.white)
                          : _headingTxtStyle,
                    ),
                    children: <Widget>[
                      AnalyticsWidget(),
                    ],
//                    trailing: ExpandIcon(
//                      isExpanded: expansionTileOpen,
//                      size: 22.0,
//                      color: Colors.black,
//                      expandedColor: Colors.white,
//                      onPressed: (bool trigger) {},
//                    ),
                  ),
                ),
                /*
                TODO LOGIC TO BE IMPLEMENTED
                if users list of category for selected contest is = 1 display
                vote analytics widget with values from that contest
                else
                build out all the category for selected contest as an expansion
                tile widget
                 */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
