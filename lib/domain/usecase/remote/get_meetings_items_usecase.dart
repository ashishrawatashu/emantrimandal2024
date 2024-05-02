import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:emantrimandal/domain/repository/remote/generateToken/generate_token_repository.dart';
import 'package:either_dart/src/either.dart';
import 'package:emantrimandal/domain/repository/remote/getMeetingsItems/get_metings_items_repository.dart';

import '../../../core/error/network_error.dart';
import '../base/base_usecase.dart';

class GetMeetingsItemsUseCase
    extends BaseUseCase<NetworkError, GetMeetingItemsParams, GetMeetingsItemsModel> {
  final GetMeetingsItemsRepository getMeetingsItemsRepository;


  GetMeetingsItemsUseCase(this.getMeetingsItemsRepository);


  @override
  Future<Either<NetworkError, GetMeetingsItemsModel>> execute(
      {required GetMeetingItemsParams params}) {
    return getMeetingsItemsRepository.getMeetingsItems(params);
  }
}
