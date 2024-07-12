part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsState {}

class ItemDetailsInitial extends ItemDetailsState {}
///get Departments
class ItemDetailsSuccessState extends ItemDetailsState {
  final ItemsDetailsModel itemDetails;
  ItemDetailsSuccessState(this.itemDetails);
}




class ItemDetailsLoadingState extends ItemDetailsState {

}


class ItemDetailsErrorState extends ItemDetailsState {


}

