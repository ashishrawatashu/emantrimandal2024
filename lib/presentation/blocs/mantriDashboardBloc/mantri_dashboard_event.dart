part of 'mantri_dashboard_bloc.dart';

@immutable
abstract class MantriDashboardEvent {}


class GetDepartmentsEvent extends MantriDashboardEvent {

}

//getMeetingItems
class GetMeetingItemsEvent extends MantriDashboardEvent {

}

//getMeetingItems
class DepartmentSelectEvent extends MantriDashboardEvent {
  final String deptId;
  DepartmentSelectEvent(this.deptId);
}




//saveDetails
class AddUpdatedDepartmentsEvent extends MantriDashboardEvent {
  final DepartmentsModel departmentsModel;
  AddUpdatedDepartmentsEvent(this.departmentsModel);
}

class AddUpdatedItemsEvent extends MantriDashboardEvent {
  final ItemsModel itemsModel;
  AddUpdatedItemsEvent(this.itemsModel);
}

class AddUpdatedItemsDetailsEvent extends MantriDashboardEvent {
  final ItemsDetailsModel itemsDetailsModel;
  AddUpdatedItemsDetailsEvent(this.itemsDetailsModel);
}
