
import 'package:emantrimandal/data/datasource/remote/generateTokenDataSource/generate_token_data_source.dart';
import 'package:emantrimandal/data/datasource/remote/getDetailsDataSource/get_details_data_source.dart';
import 'package:emantrimandal/data/datasource/remote/is_app_active_data_source/is_app_active_data_source.dart';
import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/data/model/getDetailsModel/get_details_model.dart';
import 'package:emantrimandal/data/model/is_app_active/is_app_active_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';
import 'package:emantrimandal/domain/repository/remote/generateToken/generate_token_repository.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:emantrimandal/domain/repository/remote/getDetails/get_details_repository.dart';

import '../../../core/network/utils/safe_api_call.dart';

class GetDetailsRepositoryImpl extends GetDetailsRepository {
  final GetDetailsRemoteDS remoteDS;
  final Dio dio;

  GetDetailsRepositoryImpl({
    required this.remoteDS,
    required this.dio,
  }) {
    // _dio.interceptors.add(ApiInterceptor(this, _dio, this._deviceInfoHelper));
  }


  @override
  Future<Either<NetworkError, GetDetailsModel>> getDetails(GetDetailsParams getDetailsParams) async{
    final result = await safeApiCall(
      remoteDS.getDetails(getDetailsParams),
    );
    return result!.fold(
          (l) => Left(l),
          (r) => Right(r.data.toModel()),
    );
  }
}
