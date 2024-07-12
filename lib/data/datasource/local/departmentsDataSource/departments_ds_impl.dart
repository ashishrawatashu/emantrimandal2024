import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/exceptions.dart';
import 'package:emantrimandal/data/datasource/local/departmentsDataSource/departments_data_source.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/domain/entity/local/departmentsHiveEntity/departments_hive_entity.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';

class DepartmentsLocalDsImpl implements DepartmentsLocalDataSource {
  final _kDepartments = 'departments_box';

  @override
  Future<Unit> addDepartments(DepartmentsModel departmentsList) async {
    try {
      final departmentBox = Hive.box<DepartmentsHiveEntity>(_kDepartments);
      bool meetingIDExists = false;
      for (var i = 0; i < departmentBox.length; i++) {
        final task = departmentBox.getAt(i);
        if (task!.deptID == departmentsList.deptID) {
          meetingIDExists = true;
          break;
        }
      }

      if (!meetingIDExists) {
        // No item with the same meetingID exists, so add the data
        final convertedTask = DepartmentsHiveEntity(
            deptID: departmentsList.deptID,
            deptName: departmentsList.deptName,
            minister: departmentsList.minister,
            noOfItems: departmentsList.noOfItems);

        await departmentBox.add(convertedTask);
        return Future.value(unit);
      } else {
        return Future.value(null);
      }
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteAllDepartments() async {
    try {
      final departmentBox = Hive.box<DepartmentsHiveEntity>(_kDepartments);
      await departmentBox.clear(); // Clear all items in the box
      print('All departments deleted');
      return Future.value(unit);
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteDepartmentsById(String meetingId) {
    // TODO: implement deleteDepartmentsById
    throw UnimplementedError();
  }

  @override
  Future<List<DepartmentsModel>> getDepartments() async {
    try {
      final departmentBox = Hive.box<DepartmentsHiveEntity>(_kDepartments);
      final result = departmentBox.values
          .map<DepartmentsModel>((e) => DepartmentsModel(deptID: e.deptID, deptName: e.deptName, minister: e.minister, noOfItems: e.noOfItems))
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
      Hive.registerAdapter(DepartmentsHiveEntityAdapter());
      await Hive.openBox<DepartmentsHiveEntity>(_kDepartments);
      return true;
    } catch (_) {
      throw ConnectionException();
    }
  }
}
