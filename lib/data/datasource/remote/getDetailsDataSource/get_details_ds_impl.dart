import 'package:emantrimandal/domain/entity/remote/get_details_entity/get_details_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';
import 'package:retrofit/dio.dart';

import '../../../../core/network/api_service.dart';
import 'get_details_data_source.dart';

class GetDetailsRemoteDSImpl extends GetDetailsRemoteDS {

  final ApiService apiService;

  GetDetailsRemoteDSImpl({
    required this.apiService,
  });

  @override
  Future<HttpResponse<GetDetailsEntity>> getDetails(GetDetailsParams getDetailsParams) {
    return apiService.getDetails(getDetailsParams);
  }
}
