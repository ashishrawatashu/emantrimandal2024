import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/domain/repository/local/itemDetails/itemsDetails.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';

class AddItemsDetailsUseCase extends BaseLocalUseCase<Unit, ItemsDetailsModel> {
  final ItemsDetailsLocalRepository itemsDetailsLocalRepository;

  AddItemsDetailsUseCase({required this.itemsDetailsLocalRepository});

  @override
  Future<Either<Failure, Unit>> call(ItemsDetailsModel param) async {
    return await itemsDetailsLocalRepository.addItemsDetails(param);
  }
}