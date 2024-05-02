import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';

abstract class DepartmentsRepository {
  Future<Either<Failure, List<DepartmentsModel>>> getDepartments();
  Future<Either<Failure, Unit>> addDepartments(DepartmentsModel departmentList);

}