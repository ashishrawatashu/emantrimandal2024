import 'package:either_dart/either.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';


abstract class GenerateTokenRepository {
  Future<Either<NetworkError, GenerateTokenModel>> generateToken(GenerateTokenParams generateTokenParams);
}