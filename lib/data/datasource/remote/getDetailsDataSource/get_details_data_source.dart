import 'package:emantrimandal/domain/entity/remote/get_details_entity/get_details_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';
import 'package:retrofit/dio.dart';

abstract class GetDetailsRemoteDS {
  Future<HttpResponse<GetDetailsEntity>> getDetails(GetDetailsParams getDetailsParams);
}