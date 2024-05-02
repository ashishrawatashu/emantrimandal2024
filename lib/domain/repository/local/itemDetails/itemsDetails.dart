
import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';

abstract class ItemsDetailsLocalRepository {
  Future<Either<Failure, Unit>> addItemsDetails(ItemsDetailsModel itemsDetailsModel);
  Future<Either<Failure, List<ItemsDetailsModel>>> getAllItemsDetails();
  Future<Either<Failure, ItemsDetailsModel>> getItemsByItemId(String itemId);
  Future<Either<Failure, Unit>> deleteAllItemsDetails();
}