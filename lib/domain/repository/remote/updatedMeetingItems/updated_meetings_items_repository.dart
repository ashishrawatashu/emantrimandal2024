import 'package:either_dart/either.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:emantrimandal/data/model/updatedMeetingItemsModel/updated_meetings_items_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/updated_meetings_items_params.dart';

abstract class UpdatedMeetingsItemsRepository {
  Future<Either<NetworkError, UpdatedMeetingsItemsModel>> updatedMeetingsItems(UpdatedMeetingItemsParams updatedMeetingItemsParams);
}