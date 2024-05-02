import 'package:either_dart/either.dart';
import 'package:emantrimandal/core/error/network_error.dart';
import 'package:emantrimandal/data/model/getDetailsModel/get_details_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';

abstract class GetDetailsRepository {
  Future<Either<NetworkError, GetDetailsModel>> getDetails(GetDetailsParams getDetailsParams);
}