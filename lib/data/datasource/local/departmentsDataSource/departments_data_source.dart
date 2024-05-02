import 'package:dartz/dartz.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';

abstract class DepartmentsLocalDataSource {
  Future<bool> initDb();
  Future<Unit> addDepartments(DepartmentsModel departmentsList);
  Future<List<DepartmentsModel>> getDepartments();
  Future<Unit> deleteDepartmentsById(String meetingId);
  Future<Unit> deleteAllDepartments();
}