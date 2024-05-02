import 'package:emantrimandal/data/datasource/remote/generateTokenDataSource/generate_token_data_source.dart';
import 'package:emantrimandal/domain/entity/remote/generate_token_entity/generate_token_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:retrofit/dio.dart';

import '../../../../core/network/api_service.dart';

class GenerateTokenRemoteDSImpl extends GenerateTokenRemoteDS {
  final ApiService apiService;

  GenerateTokenRemoteDSImpl({
    required this.apiService,
  });

  @override
  Future<HttpResponse<GenerateTokenEntity>> generateToken(
      GenerateTokenParams generateTokenParams) {
    return apiService.generateToken(generateTokenParams);
  }
}
