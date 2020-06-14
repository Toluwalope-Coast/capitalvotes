import 'package:capitalvotes/pages/add_nominee_with_category.dart';
import 'package:capitalvotes/pages/add_nominee_without_category.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:provider/provider.dart';

class AddNominee extends StatefulWidget {
  @override
  _AddNomineeState createState() => _AddNomineeState();
}

class _AddNomineeState extends State<AddNominee> {

  @override
  Widget build(BuildContext context) {

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);


    return  AddNomineeWithCategory();
//      contestBloc.getIsCategory == true ? AddNomineeWithCategory() : AddNomineeWithOutCategory();

  }
}
