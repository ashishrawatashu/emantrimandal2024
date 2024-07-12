import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/exceptions.dart';
import 'package:emantrimandal/data/datasource/local/itemDetails/item_details_data_source.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/domain/entity/local/itemsDetailsHiveEntity/items_details_hive_entity.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ItemsDetailsLocalDsImpl implements ItemsDetailsLocalDataSource {
  final _kItemsDetailsBox = 'itemsDetails_box';

  @override
  Future<Unit> addItemsDetails(ItemsDetailsModel itemsModel) async {
    try {
      final itemsDetailsBox =
          Hive.box<ItemsDetailsHiveEntity>(_kItemsDetailsBox);
      bool itemsIdExists = false;
      for (var i = 0; i < itemsDetailsBox.length; i++) {
        final task = itemsDetailsBox.getAt(i);
        if (task!.itemId == itemsModel.itemId) {
          itemsIdExists = true;
          break;
        }
      }
      if (!itemsIdExists) {
        // No item with the same meetingID exists, so add the data
        final convertedTask = ItemsDetailsHiveEntity(
            itemId: itemsModel.itemId,
            itemsDetails: itemsModel.itemsDetails,
            fileApprovedNote: itemsModel.fileApprovedNote,
            fileEnclosure: itemsModel.fileEnclosure);

        await itemsDetailsBox.add(convertedTask);
        return Future.value(unit);
      } else {
        return Future.value(null);
      }
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteAllItemsDetails() async {
    try {
      final itemsDetailsBox = Hive.box<ItemsDetailsHiveEntity>(_kItemsDetailsBox);
      await itemsDetailsBox.clear(); // Clear all items in the box
      print('All item details deleted');
      return Future.value(unit);
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<ItemsDetailsModel> getItemsDetailsByItemId(String itemId) async {
    // try {
    //   final itemsBox = Hive.box<ItemsDetailsHiveEntity>(_kItemsDetailsBox);
    //   final result = itemsBox.values
    //       .map((e) => ItemsDetailsModel(
    //           itemId: e.itemId,
    //           itemsDetails: e.itemsDetails,
    //           fileApprovedNote: e.fileApprovedNote,
    //           fileEnclosure: e.fileEnclosure))
    //       .toList();
    //   return result;
    // } catch (_) {
    //   throw NoDataException();
    // }

    try {
      final itemsBox = await Hive.openBox<ItemsDetailsHiveEntity>(_kItemsDetailsBox);
      final itemDetails = itemsBox.values.firstWhere((e) => e.itemId == itemId);
      if (itemDetails != null) {
        return ItemsDetailsModel(
          itemId: itemDetails.itemId,
          itemsDetails: itemDetails.itemsDetails,
          fileApprovedNote: itemDetails.fileApprovedNote,
          fileEnclosure: itemDetails.fileEnclosure,
        );
      } else {
        throw NoDataException(); // Throw an exception if item details are not found
      }
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
      Hive.registerAdapter(ItemsDetailsHiveEntityAdapter());
      await Hive.openBox<ItemsDetailsHiveEntity>(_kItemsDetailsBox);
      return true;
    } catch (_) {
      throw ConnectionException();
    }
  }
}
