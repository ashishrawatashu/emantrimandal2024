import 'package:emantrimandal/domain/entity/remote/generate_token_entity/generate_token_entity.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:retrofit/dio.dart';

abstract class GenerateTokenRemoteDS {
  Future<HttpResponse<GenerateTokenEntity>> generateToken(GenerateTokenParams generateTokenParams);
}