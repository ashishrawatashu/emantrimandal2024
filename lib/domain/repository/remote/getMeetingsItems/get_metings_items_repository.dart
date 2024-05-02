import 'package:either_dart/either.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';


abstract class GetMeetingsItemsRepository {
  Future<Either<NetworkError, GetMeetingsItemsModel>> getMeetingsItems(GetMeetingItemsParams getMeetingItemsParams);
}