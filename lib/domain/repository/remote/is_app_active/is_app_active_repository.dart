import 'package:emantrimandal/core/error/network_error.dart';
import 'package:emantrimandal/data/model/is_app_active/is_app_active_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';
import 'package:either_dart/either.dart';

abstract class IsAppActiveRepository {
  Future<Either<NetworkError, IsAppActiveModel>> isAppActive(TokenParams tokenParams);
}