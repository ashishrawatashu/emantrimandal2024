import 'package:dartz/dartz.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';
abstract class MeetingDetailsLocalRepository {
  Future<Either<Failure, Unit>> saveMeetingDetails(MeetingDetailModel meetingDetailModel);
  Future<Either<Failure, List<MeetingDetailModel>>> getMeetingDetails();
}