import 'package:emantrimandal/data/datasource/remote/getMeetingItemsDataSource/get_meeting_items_data_source.dart';
import 'package:emantrimandal/domain/entity/remote/get_meetings_items_entity/get_meetings_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/network/api_service.dart';

class GetMeetingItemsRemoteDSImpl extends GetMeetingItemsRemoteDS {
  final ApiService apiService;

  GetMeetingItemsRemoteDSImpl({
    required this.apiService,
  });

  @override
  Future<HttpResponse<GetMeetingsEntity>> getMeetingItems(
      GetMeetingItemsParams getMeetingItemsParams) {
    return apiService.getMeetingItems(getMeetingItemsParams);
  }
}
