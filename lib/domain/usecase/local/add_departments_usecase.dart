import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/domain/repository/local/departments/departments_repository.dart';

import '../base/local_base_usecase.dart';

class AddDepartmentUseCase extends BaseLocalUseCase<Unit, DepartmentsModel> {
  final DepartmentsRepository departmentsRepository;

  AddDepartmentUseCase({required this.departmentsRepository});

  @override
  Future<Either<Failure, Unit>> call(DepartmentsModel param) async {
    return await departmentsRepository.addDepartments(param);
  }
}