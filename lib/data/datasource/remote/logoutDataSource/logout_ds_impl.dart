import 'package:emantrimandal/domain/entity/remote/is_app_active/is_app_active.dart';
import 'package:emantrimandal/domain/entity/remote/logout_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/logout_params.dart';

import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';

import 'package:retrofit/dio.dart';

import '../../../../core/network/api_service.dart';
import 'logout_data_source.dart';

class LogoutRemoteDSImpl extends LogoutRemoteDS {
  final ApiService apiService;

  LogoutRemoteDSImpl(
      {required this.apiService,}
      );


  @override
  Future<HttpResponse<LogoutEntity>> logout(LogOutParams logOutParams) {
    return apiService.logout(logOutParams);
  }
}