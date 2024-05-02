
import 'package:dartz/dartz.dart';

import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/domain/repository/local/meetingDetails/meeting_details_local_repository.dart';

import '../../../data/model/getDetailsModel/meetings_details_model.dart';
import '../base/local_base_usecase.dart';

class GetMeetingDetailsUseCase extends  BaseLocalUseCase<List<MeetingDetailModel>, DefaultParams> {
  final MeetingDetailsLocalRepository getMeetingDetailsRepository;
  GetMeetingDetailsUseCase({required this.getMeetingDetailsRepository});

  @override
  Future<Either<Failure, List<MeetingDetailModel>>> call(DefaultParams param) async {
    return await getMeetingDetailsRepository.getMeetingDetails();
  }



}