import 'package:dartz/dartz.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';

abstract class ItemsLocalDataSource {
  Future<bool> initDb();
  Future<Unit> addItems(ItemsModel itemsModel);
  Future<List<ItemsModel>> getAllItems();
  Future<List<ItemsModel>> getItemsByDeptId(String deptId);
  Future<Unit> deleteAllMeeting();
}