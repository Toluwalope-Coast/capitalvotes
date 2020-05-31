import 'package:flutter/material.dart';
import 'package:capitalvotes/shared/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int feedCounts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topAppBar('Capital Votes'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex: 1, child: advertContainer()),
            Expanded(
              flex: 8,
              child: ListView.builder(
                  itemCount: feedCounts,
                  itemBuilder: (BuildContext context, int position) {
                    // lists of the entire contest collections goes below, ordered by brands the no of votes in descending order
                    return ListTile();
                  }),
            )
          ],
        ));
  }
}
