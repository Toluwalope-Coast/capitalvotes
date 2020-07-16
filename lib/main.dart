import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/add_nominee_with_category.dart';
import 'package:capitalvotes/pages/add_payment_card_screen.dart';
import 'package:capitalvotes/pages/add_paypal_account_screen.dart';
import 'package:capitalvotes/pages/add_promo_code_screen.dart';
import 'package:capitalvotes/pages/pageLoader.dart';
import 'package:capitalvotes/pages/payment_method_screen.dart';
import 'package:capitalvotes/pages/transfer_to_bank_screen.dart';
import 'package:capitalvotes/pages/vote_ana;ytics_screen.dart';
import 'package:capitalvotes/pages/withdrawal_screen.dart';
import 'package:capitalvotes/services/bank_bloc.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
import 'package:capitalvotes/services/nominee_local_state.dart';
import 'package:capitalvotes/services/nominee_update_local_state.dart';
import 'package:capitalvotes/services/nominee_without_category_local_state.dart';
import 'package:capitalvotes/services/nominee_without_category_update_local_state.dart';
import 'package:capitalvotes/services/paypal_local_bloc.dart';
import 'package:capitalvotes/services/social_media_bloc_state.dart';
//import 'package:capitalvotes/services/sign_in_authentication.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:capitalvotes/pages/home.dart';
import 'package:capitalvotes/pages/search.dart';
import 'package:capitalvotes/pages/profile.dart';
import 'package:capitalvotes/pages/profile_edit.dart';
import 'package:capitalvotes/pages/add_contest.dart';
import 'package:capitalvotes/pages/add_category.dart';
import 'package:capitalvotes/pages/add_nominee.dart';
import 'package:capitalvotes/pages/voteRate.dart';
import 'package:capitalvotes/pages/update_category_data.dart';
import 'package:capitalvotes/pages/update_nominee_with_category.dart';
import 'package:capitalvotes/pages/confirm_contest.dart';
import 'package:capitalvotes/pages/contest_view.dart';
import 'package:capitalvotes/pages/vote_cart_screen.dart';
//import 'pages/appAuthenticator.dart';
//import 'blocs/user.dart';

void main() => runApp(CapitalVotes());

class CapitalVotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return StreamProvider<User>.value(
//      value: AuthenticationService().authenticatedUser,
//      child: MaterialApp(
//        title: "Capital Votes",
//        home: AppAuthenticator()
//
//
//      ),
//    );

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ContestBloc>(
              create: (context) => ContestBloc()),
          ChangeNotifierProvider<UserProfileBloc>(
              create: (context) => UserProfileBloc()),
          ChangeNotifierProvider<LocalCategoryBlocState>(
              create: (context) => LocalCategoryBlocState()),
          ChangeNotifierProvider<LocalCategoryUpdateBlocState>(
              create: (context) => LocalCategoryUpdateBlocState()),
          ChangeNotifierProvider<NomineeLocalBlocState>(
              create: (context) => NomineeLocalBlocState()),
//          ChangeNotifierProvider<SocialMediaHandleBloc>(create: (context) => SocialMediaHandleBloc()),
          ChangeNotifierProvider<LocalUpdateNomineeWithCategoryBlocState>(
              create: (context) => LocalUpdateNomineeWithCategoryBlocState()),
          ChangeNotifierProvider<LocalNomineeWithoutCategoryBlocState>(
              create: (context) => LocalNomineeWithoutCategoryBlocState()),
          ChangeNotifierProvider<LocalNomineeWithoutUpdateBlocState>(
              create: (context) => LocalNomineeWithoutUpdateBlocState()),
          ChangeNotifierProvider<PayPalLocalBloc>(
              create: (context) => PayPalLocalBloc()),
          ChangeNotifierProvider<BankBloc>(create: (context) => BankBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: capitalVotesTheme(),
          initialRoute: '/',
          routes: {
            '/': (context) => PageLoader(),
            '/Home': (context) => Home(),
            '/Search': (context) => Search(),
            '/Profile': (context) => Profile(),
            '/AddContest': (context) => AddContest(),
            '/EditProfile': (context) => ProfileEdit(),
            '/AddCategory': (context) => AddCategory(),
            '/VoteRate': (context) => VoteRate(),
            '/UpdateCategoryData': (context) => UpdateCategoryData(),
            '/AddNominee': (context) => AddNominee(),
            '/AddNomineeWithCategory': (context) => AddNomineeWithCategory(),
            '/UpdateNomineeWithCategory': (context) =>
                UpdateNomineeWithCategory(),
            '/UpdateNomineeWithOutCategory': (context) =>
                UpdateNomineeWithCategory(),
            '/ConfirmContest': (context) => ConfirmContest(),
            '/CreatorContestView': (context) => CreatorContestView(),
            '/PaymentMethodScreen': (context) => PaymentMethodScreen(),
            '/AddPaymentCardScreen': (context) => AddPaymentCardScreen(),
            '/AddPayPalAccountScreen': (context) => AddPayPalAccountScreen(),
            '/PromoCodeScreen': (context) => AddPromoCodeScreen(),
            '/VoteAnalyticScreen': (context) => VoteAnalyticScreen(),
            '/SeeAllContestScreen': (context) => VoteAnalyticScreen(),
            '/VoteCartScreen': (context) => VoteCartScreen(),
            '/TransferToBankScreen': (context) => TransferToBankScreen(),
            '/WithdrawalScreen': (context) => WithdrawalScreen(),
          },
        ));
  }
}
