import 'package:emantrimandal/domain/entity/remote/is_app_active/is_app_active.dart';

import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';

import 'package:retrofit/dio.dart';

import '../../../../core/network/api_service.dart';
import 'is_app_active_data_source.dart';

class IsAppActiveRemoteDSImpl extends IsAppActiveRemoteDS {
  final ApiService apiService;

  IsAppActiveRemoteDSImpl(
      {required this.apiService,}
      );


  @override
  Future<HttpResponse<IsAppActive>> isAppActive(TokenParams tokenParams) {
    return apiService.isAppActive(tokenParams);
  }
}