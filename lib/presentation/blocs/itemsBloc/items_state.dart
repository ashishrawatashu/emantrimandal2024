part of 'items_bloc.dart';

@immutable
abstract class ItemsState {}

class ItemsInitial extends ItemsState {}


///get Items
class GetItemsSuccessState extends ItemsState {
  final List<ItemsModel> itemsModelList;
  GetItemsSuccessState(this.itemsModelList);
}

class ItemsLoadingState extends ItemsState {}


class ItemsLoadingErrorState extends ItemsState {}


///get Items by dept id
class GetItemsByDeptIdSuccessState extends ItemsState {
  final List<ItemsModel> itemsModelList;
  GetItemsByDeptIdSuccessState(this.itemsModelList);
}

class GetItemsByDeptIdLoadingState extends ItemsState {}


class GetItemsByDeptIdLoadingErrorState extends ItemsState {}