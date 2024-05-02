import 'package:emantrimandal/data/datasource/remote/updatedMeetingItemsDataSource/updated_meeting_items_data_source.dart';
import 'package:emantrimandal/domain/entity/remote/get_meetings_items_entity/get_meetings_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/updated_meetings_items_params.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/network/api_service.dart';
import '../../../../domain/entity/remote/updatedMeetingItemsEntity/updated_meetings_entity.dart';
class UpdatedMeetingItemsRemoteDSImpl extends UpdatedMeetingItemsRemoteDS {
  final ApiService apiService;

  UpdatedMeetingItemsRemoteDSImpl({
    required this.apiService,
  });

  @override
  Future<HttpResponse<UpdatedMeetingsEntity>> updatedMeetingItems(
      UpdatedMeetingItemsParams updatedMeetingItemsParams) {
    return apiService.updatedMeetingItems(updatedMeetingItemsParams);
  }
}
