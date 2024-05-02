part of 'download_meeting_items_bloc.dart';

@immutable
abstract class DownloadMeetingItemsEvent {}


//getMeetingItems
class GetMeetingItemsEvent extends DownloadMeetingItemsEvent {

}


//saveDetails
class AddDepartmentsEvent extends DownloadMeetingItemsEvent {
  final DepartmentsModel departmentsModel;
  AddDepartmentsEvent(this.departmentsModel);
}

class AddItemsEvent extends DownloadMeetingItemsEvent {
  final ItemsModel itemsModel;
  AddItemsEvent(this.itemsModel);
}

class AddItemsDetailsEvent extends DownloadMeetingItemsEvent {
  final ItemsDetailsModel itemsDetailsModel;
  AddItemsDetailsEvent(this.itemsDetailsModel);
}
