part of 'mantri_dashboard_bloc.dart';

@immutable
abstract class MantriDashboardState {}

class MantriDashboardInitial extends MantriDashboardState {}

///get Departments
class GetDepartmentsSuccessState extends MantriDashboardState {
  final num totalItems;
  final List<DepartmentsModel> departmentsModelList;
  GetDepartmentsSuccessState(this.departmentsModelList, this.totalItems);
}




class DepartmentLoadingState extends MantriDashboardState {}


class DepartmentLoadingErrorState extends MantriDashboardState {}


class DepartmentSelectState extends MantriDashboardState {
  final String deptId;
  DepartmentSelectState(this.deptId);
}