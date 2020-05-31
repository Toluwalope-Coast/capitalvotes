//import 'package:capitalvotes/blocs/category_bloc.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
//import 'package:capitalvotes/blocs/nominee_with_category_bloc.dart';
//import 'package:capitalvotes/blocs/nominee_without_category_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/pages/pageloader.dart';
import 'package:capitalvotes/pages/update_nominee_without_category.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
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
import 'package:capitalvotes/pages/add_category_data.dart';
import 'package:capitalvotes/pages/voterate.dart';
import 'package:capitalvotes/pages/update_category_data.dart';
import 'package:capitalvotes/pages/add_nominee_with_category.dart';
//import 'package:capitalvotes/pages/update_nominee_with_category.dart';
import 'package:capitalvotes/pages/add_nominee_without_category.dart';
import 'package:capitalvotes/pages/confirm_contest.dart';
import 'package:capitalvotes/pages/creator_view_contest.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/capitalvotes/lib/services/imagecapture.dart';
import 'package:capitalvotes/shared/multiline_textfield.dart';
//import 'pages/appauthenticator.dart';
//import 'blocs/user.dart';

void main() => runApp(CapitalVotes());

class CapitalVotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD



||||||| parent of 9bcaa76... stage
<<<<<<< HEAD



=======
    // TODO: implement build
>>>>>>> enny
=======
    // TODO: implement build
>>>>>>> 9bcaa76... stage
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
            initialRoute: '/Home',
          routes: {
            '/': (context) => PageLoader(),
            '/Home': (context) => Home(),
            '/Search': (context) => Search(),
            '/Profile': (context) => Profile(),
            '/AddContest': (context) => AddContest(),
            '/EditProfile': (context) => ProfileEdit(),
            '/MultiLineText': (context) => MultiLineTextField(),
            '/ImageCapture': (context) => ImageCapture(),
            '/AddCategory': (context) => AddCategory(),
            '/AddCategoryData': (context) => AddCategoryData(),
            '/VoteRate': (context) => VoteRate(),
            '/UpdateCategoryData': (context) => UpdateCategoryData(),
            '/AddNomineeWithCategory': (context) => AddNomineeWithCategory(),
            '/UpdateNomineeWithCategory': (context) => UpdateNomineeWithCategory(),
            '/AddNomineeWithOutCategory': (context) => AddNomineeWithOutCategory(),
            '/UpdateNomineeWithOutCategory': (context) => UpdateNomineeWithoutCategory(),
            '/ConfirmContest': (context) => ConfirmContest(),
            '/CreatorContestView': (context) => CreatorContestView(),
          },

        )
    );
  }
}
