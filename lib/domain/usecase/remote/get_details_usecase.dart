import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/data/model/getDetailsModel/get_details_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';
import 'package:either_dart/src/either.dart';
import 'package:emantrimandal/domain/repository/remote/getDetails/get_details_repository.dart';

import '../../../core/error/network_error.dart';
import '../base/base_usecase.dart';

class GetDetailsUseCase
    extends BaseUseCase<NetworkError, GetDetailsParams, GetDetailsModel> {
  final GetDetailsRepository getDetailsRepository;


  GetDetailsUseCase(this.getDetailsRepository);


  @override
  Future<Either<NetworkError, GetDetailsModel>> execute(
      {required GetDetailsParams params}) {
    return getDetailsRepository.getDetails(params);
  }
}
