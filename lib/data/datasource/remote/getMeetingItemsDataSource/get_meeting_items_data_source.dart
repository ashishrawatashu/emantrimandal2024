
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:retrofit/dio.dart';

import '../../../../domain/entity/remote/get_meetings_items_entity/get_meetings_entity.dart';

abstract class GetMeetingItemsRemoteDS {
  Future<HttpResponse<GetMeetingsEntity>> getMeetingItems(GetMeetingItemsParams getMeetingItemsParams);
}