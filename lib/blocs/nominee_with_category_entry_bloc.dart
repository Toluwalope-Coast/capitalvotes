import 'package:capitalvotes/blocs/social_handlesBloc.dart';

class NomineeWithCategoryBloc {
  String nomineeName;
  String nomineeProfession;
  String nomineeImage;
  String nomineeState;
  String nomineeCountry;
  String nomineeNumber;
  String nomineeContestName;
  String nomineeContestBanner;
  String nomineeContestEndDate;
  bool isNomineeContestCategory;
  int nomineeContestCategoryIndex;
  String nomineeContestCategoryName;
  String nomineeContestVoteCurrency;
  double nomineeContestVoteCost;
  int nomineeContestVoteScore;
  String nomineeContestVoteScorePercentage;
  String nomineeContestResult;

  List<SocialMediaHandle> nomineeSocialMediaHandle = [];
}
