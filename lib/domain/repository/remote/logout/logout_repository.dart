import 'package:either_dart/either.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:emantrimandal/data/model/logOutModel/log_out_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/logout_params.dart';
abstract class LogoutRepository {
  Future<Either<NetworkError, LogoutModel>> logout(LogOutParams logOutParams);
}