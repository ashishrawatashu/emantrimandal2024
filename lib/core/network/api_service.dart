import 'package:emantrimandal/domain/entity/remote/generate_token_entity/generate_token_entity.dart';
import 'package:emantrimandal/domain/entity/remote/get_details_entity/get_details_entity.dart';
import 'package:emantrimandal/domain/entity/remote/get_meetings_items_entity/get_meetings_entity.dart';
import 'package:emantrimandal/domain/entity/remote/is_app_active/is_app_active.dart';
import 'package:emantrimandal/domain/entity/remote/logout_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/logout_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';
import 'package:dio/dio.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/updated_meetings_items_params.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entity/remote/updatedMeetingItemsEntity/updated_meetings_entity.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build

@RestApi()
abstract class ApiService {
  factory ApiService({
    required Dio dio,
    required String baseUrl,
  }) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @FormUrlEncoded()
  @POST("/isActiveApp")
  Future<HttpResponse<IsAppActive>> isAppActive(@Body()TokenParams tokenParams);


  @FormUrlEncoded()
  @POST("/GenerateToken")
  Future<HttpResponse<GenerateTokenEntity>> generateToken(@Body()GenerateTokenParams generateTokenParams);


  @FormUrlEncoded()
  @POST("/GetDetails")
  Future<HttpResponse<GetDetailsEntity>> getDetails(@Body()GetDetailsParams getDetailsParams);


  @FormUrlEncoded()
  @POST("/GetMeetingItems")
  Future<HttpResponse<GetMeetingsEntity>> getMeetingItems(@Body()GetMeetingItemsParams getMeetingItemsParams);


  @FormUrlEncoded()
  @POST("/Logout")
  Future<HttpResponse<LogoutEntity>> logout(@Body()LogOutParams logOutParams);


  @FormUrlEncoded()
  @POST("/UpdatedMeetingItems")
  Future<HttpResponse<UpdatedMeetingsEntity>> updatedMeetingItems(@Body()UpdatedMeetingItemsParams updatedMeetingItemsParams);

}
