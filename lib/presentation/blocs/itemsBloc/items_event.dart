part of 'items_bloc.dart';

@immutable
abstract class ItemsEvent {}



class GetItemsEvent extends ItemsEvent {

}


class GetItemsByDeptIdEvent extends ItemsEvent {
  String deptId;

  GetItemsByDeptIdEvent(this.deptId);
}