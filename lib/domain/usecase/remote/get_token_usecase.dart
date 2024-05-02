import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:emantrimandal/domain/repository/remote/generateToken/generate_token_repository.dart';
import 'package:either_dart/src/either.dart';

import '../../../core/error/network_error.dart';
import '../base/base_usecase.dart';

class GenerateTokenUseCase
    extends BaseUseCase<NetworkError, GenerateTokenParams, GenerateTokenModel> {
  final GenerateTokenRepository generateTokenRepository;

  GenerateTokenUseCase(this.generateTokenRepository);

  @override
  Future<Either<NetworkError, GenerateTokenModel>> execute(
      {required GenerateTokenParams params}) {
    return generateTokenRepository.generateToken(params);
  }
}
