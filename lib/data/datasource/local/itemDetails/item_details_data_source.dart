import 'package:dartz/dartz.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';

abstract class ItemsDetailsLocalDataSource {
  Future<bool> initDb();
  Future<Unit> addItemsDetails(ItemsDetailsModel itemsModel);
  Future<ItemsDetailsModel> getItemsDetailsByItemId(String itemId);
  Future<Unit> deleteAllItemsDetails();
}