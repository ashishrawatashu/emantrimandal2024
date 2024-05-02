part of 'mantri_dashboard_bloc.dart';

@immutable
abstract class MantriDashboardState {}

class MantriDashboardInitial extends MantriDashboardState {}

///get Departments
class GetDepartmentsSuccessState extends MantriDashboardState {
  final List<DepartmentsModel> departmentsModelList;
  GetDepartmentsSuccessState(this.departmentsModelList);
}


class DepartmentLoadingState extends MantriDashboardState {}


class DepartmentLoadingErrorState extends MantriDashboardState {}

// ///get Items
// class GetItemsSuccessState extends MantriDashboardState {
//   final List<ItemsModel> itemsModelList;
//   GetItemsSuccessState(this.itemsModelList);
// }
//
// class ItemsLoadingState extends MantriDashboardState {}
//
//
// class ItemsLoadingErrorState extends MantriDashboardState {}
//
//
// ///get Items by dept id
// class GetItemsByDeptIdSuccessState extends MantriDashboardState {
//   final List<ItemsModel> itemsModelList;
//   GetItemsByDeptIdSuccessState(this.itemsModelList);
// }
//
// class GetItemsByDeptIdLoadingState extends MantriDashboardState {}
//
//
// class GetItemsByDeptIdLoadingErrorState extends MantriDashboardState {}