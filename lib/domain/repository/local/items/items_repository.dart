import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';

abstract class ItemsLocalRepository {
  Future<Either<Failure, Unit>> addItems(ItemsModel meetingDetailModel);
  Future<Either<Failure, List<ItemsModel>>> getAllItems();
  Future<Either<Failure, List<ItemsModel>>> getItemsByDeptId(String deptId);
  Future<Either<Failure, Unit>> deleteAllItems();
}