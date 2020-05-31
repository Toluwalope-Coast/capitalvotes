//import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
//import 'package:capitalvotes/blocs/nominee_with_category_bloc.dart';
//import 'package:capitalvotes/blocs/nominee_without_category_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/pageloader.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
//import 'package:capitalvotes/services/sign_in_authentication.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'pages/appauthenticator.dart';
//import 'blocs/user.dart';

void main() => runApp(CapitalVotes());

class CapitalVotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          ChangeNotifierProvider<ContestBloc>(create: (context) => ContestBloc()),
          ChangeNotifierProvider<UserProfileBloc>(create: (context) => UserProfileBloc()),
          ChangeNotifierProvider<LocalCategoryBlocState>(create: (context) => LocalCategoryBlocState()),
          ChangeNotifierProvider<LocalCategoryUpdateBlocState>(create: (context) => LocalCategoryUpdateBlocState()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: capitalVotesTheme(),
            home: PageLoader()));
  }
}
