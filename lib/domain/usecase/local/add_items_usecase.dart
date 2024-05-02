import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/repository/local/items/items_repository.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';

class AddItemsUseCase extends BaseLocalUseCase<Unit, ItemsModel> {
  final ItemsLocalRepository itemsLocalRepository;

  AddItemsUseCase({required this.itemsLocalRepository});

  @override
  Future<Either<Failure, Unit>> call(ItemsModel param) async {
    return await itemsLocalRepository.addItems(param);
  }
}