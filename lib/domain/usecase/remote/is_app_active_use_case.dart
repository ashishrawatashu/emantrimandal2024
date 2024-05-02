import 'package:emantrimandal/data/model/is_app_active/is_app_active_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';
import 'package:emantrimandal/domain/repository/remote/is_app_active/is_app_active_repository.dart';
import 'package:either_dart/src/either.dart';

import '../../../core/error/network_error.dart';
import '../base/base_usecase.dart';

class IsAppActiveUseCase
    extends BaseUseCase<NetworkError, TokenParams, IsAppActiveModel> {
  final IsAppActiveRepository isAppActiveRepository;

  IsAppActiveUseCase(this.isAppActiveRepository);

  @override
  Future<Either<NetworkError, IsAppActiveModel>> execute(
      {required TokenParams params}) {
    return isAppActiveRepository.isAppActive(params);
  }
}
