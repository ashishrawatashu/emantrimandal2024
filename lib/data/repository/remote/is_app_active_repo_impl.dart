
import 'package:emantrimandal/data/datasource/remote/is_app_active_data_source/is_app_active_data_source.dart';
import 'package:emantrimandal/data/model/is_app_active/is_app_active_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/token_params.dart';
import 'package:emantrimandal/domain/repository/remote/is_app_active/is_app_active_repository.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';

import '../../../core/network/utils/safe_api_call.dart';

class IsAppActiveRepositoryImpl extends IsAppActiveRepository {
  final IsAppActiveRemoteDS remoteDS;
  final Dio dio;

  IsAppActiveRepositoryImpl({
    required this.remoteDS,
    required this.dio,
  }) {
    // _dio.interceptors.add(ApiInterceptor(this, _dio, this._deviceInfoHelper));
  }

  @override
  Future<Either<NetworkError, IsAppActiveModel>> isAppActive(TokenParams tokenParams) async {
    final result = await safeApiCall(
      remoteDS.isAppActive(tokenParams),
    );
    return result!.fold(
          (l) => Left(l),
          (r) => Right(r.data.toModel()),
    );
  }
}
