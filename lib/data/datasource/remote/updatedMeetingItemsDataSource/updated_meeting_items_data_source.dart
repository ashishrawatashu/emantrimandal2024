import 'package:emantrimandal/domain/entity/remote/get_meetings_items_entity/get_meetings_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/updated_meetings_items_params.dart';
import 'package:retrofit/dio.dart';

import '../../../../domain/entity/remote/updatedMeetingItemsEntity/updated_meetings_entity.dart';

abstract class UpdatedMeetingItemsRemoteDS {
  Future<HttpResponse<UpdatedMeetingsEntity>> updatedMeetingItems(UpdatedMeetingItemsParams updatedMeetingItemsParams);
}