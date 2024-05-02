import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';
import 'package:emantrimandal/domain/repository/local/meetingDetails/meeting_details_local_repository.dart';
import '../base/local_base_usecase.dart';

class SaveMeetingDetailsUseCase extends BaseLocalUseCase<Unit, MeetingDetailModel> {
  final MeetingDetailsLocalRepository saveMeetingDetailsRepository;

  SaveMeetingDetailsUseCase({required this.saveMeetingDetailsRepository});

  @override
  Future<Either<Failure, Unit>> call(MeetingDetailModel param) async {
    return await saveMeetingDetailsRepository.saveMeetingDetails(param);
  }

}
