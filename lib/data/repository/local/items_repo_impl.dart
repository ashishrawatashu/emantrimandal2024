import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/exceptions.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/datasource/local/itemsDataSource/items_data_source.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/repository/local/items/items_repository.dart';

class ItemsRepositoryImpl implements ItemsLocalRepository {
  final ItemsLocalDataSource itemsLocalDataSource;

  ItemsRepositoryImpl({required this.itemsLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addItems(ItemsModel meetingDetailModel) async {
    try {
      final response = await itemsLocalDataSource.addItems(ItemsModel(
          itemID: meetingDetailModel.itemID,
          deptID: meetingDetailModel.deptID,
          briefSubject: meetingDetailModel.briefSubject,
          detailedSubject: meetingDetailModel.detailedSubject,
          fileNumber: meetingDetailModel.fileNumber));
      return Right(response);
    } on ConnectionException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAllItems() async {
    try{
      final response = await itemsLocalDataSource.deleteAllMeeting();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ItemsModel>>> getAllItems() async {
    try{
      final response = await itemsLocalDataSource.getAllItems();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ItemsModel>>> getItemsByDeptId(String deptId) async {
    try{
      final response = await itemsLocalDataSource.getItemsByDeptId(deptId);
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }
}
