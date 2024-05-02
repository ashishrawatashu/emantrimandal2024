import 'package:emantrimandal/domain/entity/remote/logout_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/logout_params.dart';
import 'package:retrofit/dio.dart';

abstract class LogoutRemoteDS {
  Future<HttpResponse<LogoutEntity>> logout(LogOutParams logOutParams);
}