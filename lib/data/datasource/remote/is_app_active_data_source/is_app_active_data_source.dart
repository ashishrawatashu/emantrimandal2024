
import 'package:emantrimandal/domain/entity/remote/is_app_active/is_app_active.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';
import 'package:retrofit/dio.dart';

abstract class IsAppActiveRemoteDS {
  Future<HttpResponse<IsAppActive>> isAppActive(TokenParams tokenParams);
}