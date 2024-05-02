import 'package:dartz/dartz.dart';
import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';

abstract class MeetingLocalDataSource {
  Future<bool> initDb();
  Future<Unit> saveMeetingDetails(MeetingDetailModel meetingDetailModel);
  Future<List<MeetingDetailModel>> getMeetingDetails();
  Future<Unit> deleteMeetingById(String meetingId);
  Future<Unit> deleteAllMeeting();
}