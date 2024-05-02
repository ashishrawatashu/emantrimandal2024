import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/updated_meetings_items_params.dart';
import 'package:either_dart/src/either.dart';
import 'package:emantrimandal/domain/repository/remote/updatedMeetingItems/updated_meetings_items_repository.dart';

import '../../../core/error/network_error.dart';
import '../../../data/model/updatedMeetingItemsModel/updated_meetings_items_model.dart';
import '../base/base_usecase.dart';

class UpdatedMeetingItemsUseCase
    extends BaseUseCase<NetworkError, UpdatedMeetingItemsParams, UpdatedMeetingsItemsModel> {
  final UpdatedMeetingsItemsRepository updatedMeetingsItemsRepository;


  UpdatedMeetingItemsUseCase(this.updatedMeetingsItemsRepository);

  @override
  Future<Either<NetworkError, UpdatedMeetingsItemsModel>> execute(
      {required UpdatedMeetingItemsParams params}) {
    return updatedMeetingsItemsRepository.updatedMeetingsItems(params);
  }
}
