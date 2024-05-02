import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/exceptions.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/datasource/local/itemDetails/item_details_data_source.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/domain/repository/local/itemDetails/itemsDetails.dart';

class ItemsDetailsRepositoryImpl implements ItemsDetailsLocalRepository {
  final ItemsDetailsLocalDataSource itemsDetailsLocalDataSource;

  ItemsDetailsRepositoryImpl({required this.itemsDetailsLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addItemsDetails(
      ItemsDetailsModel itemsDetailsModel) async {
    try {
      final response = await itemsDetailsLocalDataSource.addItemsDetails(
          ItemsDetailsModel(
              itemId: itemsDetailsModel.itemId,
              itemsDetails: itemsDetailsModel.itemsDetails,
              fileApprovedNote: itemsDetailsModel.fileApprovedNote,
              fileEnclosure: itemsDetailsModel.fileEnclosure));
      return Right(response);
    } on ConnectionException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAllItemsDetails() async {
    try{
      final response = await itemsDetailsLocalDataSource.deleteAllItemsDetails();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ItemsDetailsModel>>> getAllItemsDetails() {
    // TODO: implement getAllItemsDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ItemsDetailsModel>> getItemsByItemId(String itemId) async {
    try{
      final response = await itemsDetailsLocalDataSource.getItemsDetailsByItemId(itemId);
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }
}
