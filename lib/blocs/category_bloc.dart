import 'package:capitalvotes/blocs/nominee_with_category_bloc.dart';

class CategoryBloc{

  String categoryId;
  String categoryName;
  String categoryDescription;
  String categoryBanner;

  List <NomineeWithCategoryBloc> nomineesList = [];



// Special Functions


  addNomineeToCategoryList(NomineeWithCategoryBloc nominee){
    nomineesList.add(nominee);
  }

  removeNomineeFromCategoryList(int index){
    nomineesList.removeAt(index);
  }
updateNomineeFromCategoryList(int index, NomineeWithCategoryBloc nominee){
    nomineesList.removeAt(index);
    nomineesList.insert(index, nominee);
}

deleteTheEntireNomineeFromCategoryList(){
  nomineesList.clear();
}


}