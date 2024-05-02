part of 'download_meeting_items_bloc.dart';

@immutable
abstract class DownloadMeetingItemsState extends Equatable {
  const DownloadMeetingItemsState();

  @override
  List<Object?> get props => [];
}

class DownloadMeetingItemsInitial extends DownloadMeetingItemsState {}

class NavigateToDownloadScreenToMantriInfoState
    extends DownloadMeetingItemsState {}

//getMeetingItems

class GetMeetingItemsLoading extends DownloadMeetingItemsState {}

class GetMeetingItemsEmpty extends DownloadMeetingItemsState {}

class GetMeetingItemsError extends DownloadMeetingItemsState {
  final NetworkError error;

  GetMeetingItemsError(this.error);

  @override
  List<Object?> get props => [error];
}

class GetMeetingItemsHasData extends DownloadMeetingItemsState {
  final GetMeetingsItemsModel result;

  GetMeetingItemsHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class GetMeetingItemsHasNoData extends DownloadMeetingItemsState {
  final GetMeetingsItemsModel result;

  GetMeetingItemsHasNoData(this.result);

  @override
  List<Object?> get props => [result];
}

//get meeting

class GetMeetingDetailsSuccessState extends DownloadMeetingItemsState {
  final List<DepartmentsModel> departmentsModelList;

  GetMeetingDetailsSuccessState(this.departmentsModelList);

}


//add departments
class AddDepartmentsLoadingState extends DownloadMeetingItemsState {}

class AddDepartmentsSuccessState extends DownloadMeetingItemsState {}

class AddDepartmentsErrorState extends DownloadMeetingItemsState {
  final Failure error;

  AddDepartmentsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


//add items
class AddItemsLoadingState extends DownloadMeetingItemsState {}

class AddItemsSuccessState extends DownloadMeetingItemsState {}

class AddItemsErrorState extends DownloadMeetingItemsState {
  final Failure error;

  AddItemsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

//add itemsDetails
class AddItemsDetailsLoadingState extends DownloadMeetingItemsState {}

class AddItemsDetailsSuccessState extends DownloadMeetingItemsState {}

class AddItemsDetailsErrorState extends DownloadMeetingItemsState {
  final Failure error;

  AddItemsDetailsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}









