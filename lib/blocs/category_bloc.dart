import 'package:capitalvotes/blocs/nominee_bloc.dart';

class CategoryBloc{

  String categoryId;
  int categoryIndex;
  String categoryName;
  String categoryDescription;
  String categoryBanner;

  List <NomineeBloc> nomineesList = [];



// Special Functions

  addNomineeToCategoryList(NomineeBloc nominee){
    nomineesList.add(nominee);
  }

  removeNomineeFromCategoryList(int index){
    nomineesList.removeAt(index);
  }
  updateNomineeFromCategoryList(int index, NomineeBloc nominee){
    nomineesList.removeAt(index);
    nomineesList.insert(index, nominee);
  }

  deleteTheEntireNomineeFromCategoryList(){
    nomineesList.clear();
  }


}