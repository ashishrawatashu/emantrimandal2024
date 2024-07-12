part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsEvent {

}

//getMeetingItemsDetails
class GetItemsDetailsEvent extends ItemDetailsEvent {
  String itemId;
  GetItemsDetailsEvent(this.itemId);
}
