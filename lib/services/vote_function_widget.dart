import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/material.dart';

class VoteFunctionWidget extends StatefulWidget {
  @override
  _VoteFunctionWidgetState createState() => _VoteFunctionWidgetState();
}

class _VoteFunctionWidgetState extends State<VoteFunctionWidget> {
  int baseVotePrice = 50;
  int baseNumOfVotes = 1;

  void increaseVote() {
    setState(() => baseNumOfVotes++);
  }

  void decreaseVote() {
    setState(() => baseNumOfVotes--);
  }

  String calcVotePrice() {
    return '${baseNumOfVotes * baseVotePrice}';
  }

  // WIDGETS

  Widget _votePriceDisplay() {
    return Text(
      'N${calcVotePrice()}',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
    );
  }

//  Helper method to produce vote function buttons
  Widget _voteFuncBtn(VoidCallback onPressed, title) {
    return FlatButton(
      onPressed: onPressed,
      onLongPress: onPressed,
      shape: CircleBorder(
        side: BorderSide(
          width: 2.0,
          color: Colors.grey[200],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget _voteCountDisplay() {
    return Container(
      width: 80.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: capitalVotesTheme().primaryColor,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Center(
        child: Text(
          '$baseNumOfVotes',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _votePurchaseButton() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 160.0,
        maxWidth: 180.0,
      ),
      child: RaisedButton(
        child: Text('APPLY'),
        color: capitalVotesTheme().primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//
          // Vote price display
          _votePriceDisplay(),

          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//
              // Reduce vote count button
              _voteFuncBtn(baseNumOfVotes != 1 ? decreaseVote : () {}, '-'),
//
              // Vote count display
              _voteCountDisplay(),
//
              // Increase vote count button
              _voteFuncBtn(increaseVote, '+'),
//
            ],
          ),
          SizedBox(height: 60.0),
//
          // Vote purchase button
          _votePurchaseButton(),
        ],
      ),
    );
  }
}
