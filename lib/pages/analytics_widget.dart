import 'package:capitalvotes/shared/theme.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalyticsWidget extends StatelessWidget {
  final TextStyle _headingTxtStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );
  final TextStyle _cardTxtStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
  );
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: <Widget>[
//        CONTEST GRAPH
          Container(
            height: _screenHeight * 0.38,
            child: Center(
              child: Text('Graph Here Loading....', style: _headingTxtStyle),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 0, 12.0),
            child: Text('Individual Analysis', style: _headingTxtStyle),
          ),
//        CONTESTANT ANALYSIS CARD BUILDER
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _screenWidth <= 360 ? 2 : 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: _screenWidth / (_screenHeight * 0.68),
            ),
            itemCount: voteAnalysisData.length,
            itemBuilder: ((BuildContext context, index) {
              ContestantVotingInfo data = voteAnalysisData[index];
              return contestantAnalysisCard(
                context,
                voteCount: data.voteCount,
                votePercentage: data.votePercentage,
                voteCost: data.voteCost,
                contestantName: data.contestantName,
                contestantImage: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                ),
              );
            }),
          ),
          Divider(),
//        TOTAL VOTES AND EARNINGS CONTAINER
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Total Vote Count',
                  style: _headingTxtStyle,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    '64,873',
                    style: TextStyle(
//                    fontWeight: FontWeight.w600,
                      fontSize: 35.0,
                      color: capitalVotesTheme().primaryColor,
                    ),
                  ),
                ),
                FlatButton(
                  child: Text(
                    'View my earnings',
                    style: _headingTxtStyle.copyWith(
                        color: capitalVotesTheme().primaryColor),
                  ),
                  onPressed: () {
                    pushGoTo(context, '/EarningScreen');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//  Helper method to build analysis card widget
  Widget contestantAnalysisCard(
    BuildContext context, {
    int voteCount,
    int voteCost,
    int votePercentage,
    String contestantName,
    Image contestantImage,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[300], blurRadius: 2.0, spreadRadius: 2.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: MediaQuery.of(context).size.width * 0.08,
              child: ClipOval(
                child: contestantImage,
              ),
            ),
          ),
          Text(contestantName, style: _headingTxtStyle),
          Text(
            '$votePercentage' + '%',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
            child: Text('vote count : $voteCount', style: _cardTxtStyle),
          ),
          Text('Total vote cost', style: _cardTxtStyle),
          Text(
            'NGN$voteCost',
            style:
                _cardTxtStyle.copyWith(color: capitalVotesTheme().primaryColor),
          )
        ],
      ),
    );
  }
}

/*
DUMMY DATA FOR BUILDING UI
 */
class ContestantVotingInfo {
  int voteCount;
  int voteCost;
  int votePercentage;
  String contestantName;

  ContestantVotingInfo(
      {this.voteCount,
      this.voteCost,
      this.votePercentage,
      this.contestantName});
}

List voteAnalysisData = [
  ContestantVotingInfo(
      voteCost: 28250,
      votePercentage: 55,
      voteCount: 12871,
      contestantName: 'john'),
  ContestantVotingInfo(
      voteCost: 28250,
      votePercentage: 76,
      voteCount: 12871,
      contestantName: 'Kent'),
  ContestantVotingInfo(
      voteCost: 28250,
      votePercentage: 24,
      voteCount: 12871,
      contestantName: 'Kelvin'),
  ContestantVotingInfo(
      voteCost: 28250,
      votePercentage: 47,
      voteCount: 12871,
      contestantName: 'Jennifer'),
  ContestantVotingInfo(
      voteCost: 28250,
      votePercentage: 40,
      voteCount: 12871,
      contestantName: 'Chloe'),
  ContestantVotingInfo(
      voteCost: 28250,
      votePercentage: 38,
      voteCount: 12871,
      contestantName: 'Matthew'),
];
