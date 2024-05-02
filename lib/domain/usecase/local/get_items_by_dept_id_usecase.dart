import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/repository/local/items/items_repository.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';

class GetItemsByDeptIdUseCase extends BaseLocalUseCase<List<ItemsModel>, String> {
  final ItemsLocalRepository itemsLocalRepository;

  GetItemsByDeptIdUseCase({required this.itemsLocalRepository});

  @override
  Future<Either<Failure, List<ItemsModel>>> call(String deptId) async {
    return itemsLocalRepository.getItemsByDeptId(deptId);
  }

}