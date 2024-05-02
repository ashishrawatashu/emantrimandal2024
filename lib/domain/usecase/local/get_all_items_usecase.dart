import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/repository/local/items/items_repository.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';

class GetAllItemsUseCase extends BaseLocalUseCase<List<ItemsModel>, DefaultParams> {
  final ItemsLocalRepository itemsLocalRepository;

  GetAllItemsUseCase({required this.itemsLocalRepository});

  @override
  Future<Either<Failure, List<ItemsModel>>> call(DefaultParams param) async {
    return itemsLocalRepository.getAllItems();
  }

}