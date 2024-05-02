import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/domain/repository/local/departments/departments_repository.dart';

import '../base/local_base_usecase.dart';


class GetDepartmentUseCase extends BaseLocalUseCase<List<DepartmentsModel>, DefaultParams> {
  final DepartmentsRepository departmentsRepository;

  GetDepartmentUseCase({required this.departmentsRepository});

  @override
  Future<Either<Failure, List<DepartmentsModel>>> call(DefaultParams param) async {

    return departmentsRepository.getDepartments();
  }

}