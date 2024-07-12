import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../repository/local/departments/departments_repository.dart';
import '../base/local_base_usecase.dart';

class DeleteAllDepartmentsUseCase extends BaseLocalUseCase<Unit, DefaultParams> {
  final DepartmentsRepository departmentsRepository;

  DeleteAllDepartmentsUseCase({required this.departmentsRepository});

  @override
  Future<Either<Failure, Unit>> call(DefaultParams param) async {
    return await departmentsRepository.deleteAllDepartments();
  }
}