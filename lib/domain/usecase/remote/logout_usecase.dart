import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import 'package:emantrimandal/data/model/logOutModel/log_out_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/logout_params.dart';
import 'package:emantrimandal/domain/repository/remote/generateToken/generate_token_repository.dart';
import 'package:either_dart/src/either.dart';
import 'package:emantrimandal/domain/repository/remote/getMeetingsItems/get_metings_items_repository.dart';
import 'package:emantrimandal/domain/repository/remote/logout/logout_repository.dart';

import '../../../core/error/network_error.dart';
import '../base/base_usecase.dart';

class LogoutUseCase
    extends BaseUseCase<NetworkError, LogOutParams, LogoutModel> {
  final LogoutRepository logoutRepository;


  LogoutUseCase(this.logoutRepository);

  @override
  Future<Either<NetworkError, LogoutModel>> execute(
      {required LogOutParams params}) {
    return logoutRepository.logout(params);
  }
}
