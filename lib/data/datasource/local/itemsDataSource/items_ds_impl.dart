import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/exceptions.dart';
import 'package:emantrimandal/data/datasource/local/itemsDataSource/items_data_source.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/entity/local/itemsHiveEntity/items_hive_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' as foundation;

class ItemsLocalDsImpl implements ItemsLocalDataSource {

  final _kItemsBox = 'items_box';
  @override
  Future<Unit> addItems(ItemsModel itemsModel) async {
    try {
      final itemsBox = Hive.box<ItemsHiveEntity>(_kItemsBox);
      bool itemsIdExists = false;
      for (var i = 0; i < itemsBox.length; i++) {
        final task = itemsBox.getAt(i);
        if (task!.itemID == itemsModel.itemID) {
          itemsIdExists = true;
          break;
        }
      }
      if (!itemsIdExists) {
        // No item with the same meetingID exists, so add the data
        final convertedTask = ItemsHiveEntity(
            itemID: itemsModel.itemID,
            deptID: itemsModel.deptID,
            briefSubject: itemsModel.briefSubject,
            detailedSubject: itemsModel.detailedSubject,
            fileNumber: itemsModel.fileNumber);

        print('DATA IS ADDED');
        await itemsBox.add(convertedTask);
        return Future.value(unit);
      } else {
        print('Duplicate data detected');
        return Future.value(null);
      }
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteAllMeeting() {
    // TODO: implement deleteAllMeeting
    throw UnimplementedError();
  }

  @override
  Future<List<ItemsModel>> getAllItems() async {
    try {
      final itemsBox = Hive.box<ItemsHiveEntity>(_kItemsBox);
      final result = itemsBox.values
          .map<ItemsModel>((e) => ItemsModel(
              itemID: e.itemID,
              deptID: e.deptID,
              briefSubject: e.briefSubject,
              detailedSubject: e.detailedSubject,
              fileNumber: e.fileNumber))
          .toList();
      return result;
    } catch (_) {
      throw NoDataException();
    }
  }

  @override
  Future<List<ItemsModel>> getItemsByDeptId(String deptId) async {
    try {
      final itemsBox = Hive.box<ItemsHiveEntity>(_kItemsBox);
      final result = itemsBox.values
          .where((e) => e.deptID == deptId) // Filter items by deptId
          .map((e) => ItemsModel(
              itemID: e.itemID,
              deptID: e.deptID,
              briefSubject: e.briefSubject,
              detailedSubject: e.detailedSubject,
              fileNumber: e.fileNumber))
          .toList();
      return result;
    } catch (_) {
      throw NoDataException();
    }
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      Hive.registerAdapter(ItemsHiveEntityAdapter());
      await Hive.openBox<ItemsHiveEntity>(_kItemsBox);
      return true;
    } catch (_) {
      throw ConnectionException();
    }
  }
}
