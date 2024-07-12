import 'package:dartz/dartz.dart';
import 'package:emantrimandal/domain/repository/local/items/items_repository.dart';
import '../../../core/error/failure.dart';
import '../../repository/local/departments/departments_repository.dart';
import '../base/local_base_usecase.dart';

class DeleteAllItemsUseCase extends BaseLocalUseCase<Unit, DefaultParams> {
  final ItemsLocalRepository itemsLocalRepository;

  DeleteAllItemsUseCase({required this.itemsLocalRepository});

  @override
  Future<Either<Failure, Unit>> call(DefaultParams param) async {
    return await itemsLocalRepository.deleteAllItems();
  }
}