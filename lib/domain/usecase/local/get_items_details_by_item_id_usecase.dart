import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/domain/repository/local/itemDetails/itemsDetails.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';

class GetItemsDetailsByItemIdUseCase extends BaseLocalUseCase<ItemsDetailsModel, String> {
  final ItemsDetailsLocalRepository itemsLocalRepository;
  GetItemsDetailsByItemIdUseCase({required this.itemsLocalRepository});
  @override
  Future<Either<Failure, ItemsDetailsModel>> call(String itemId) async {
    return itemsLocalRepository.getItemsByItemId(itemId);
  }
}