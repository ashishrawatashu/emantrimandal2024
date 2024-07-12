import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/exceptions.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/datasource/local/departmentsDataSource/departments_data_source.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/domain/repository/local/departments/departments_repository.dart';

class DepartmentsRepositoryImpl implements DepartmentsRepository {
  final DepartmentsLocalDataSource departmentsLocalDataSource;

  DepartmentsRepositoryImpl({required this.departmentsLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addDepartments(
      DepartmentsModel departmentList) async {
    try {
      final response = await departmentsLocalDataSource.addDepartments(
          DepartmentsModel(
              deptID: departmentList.deptID,
              deptName: departmentList.deptName,
              minister: departmentList.minister,
              noOfItems: departmentList.noOfItems));
      return Right(response);
    } on ConnectionException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<DepartmentsModel>>> getDepartments() async {
    try {
      final response = await departmentsLocalDataSource.getDepartments();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAllDepartments() async {
    try{
      final response = await departmentsLocalDataSource.deleteAllDepartments();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

}
