import 'package:dartz/dartz.dart';

import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/datasource/local/meetingDetailsDataSource/meeting_details_data_source.dart';

import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';
import 'package:emantrimandal/domain/repository/local/meetingDetails/meeting_details_local_repository.dart';

import '../../../core/error/exceptions.dart';

class MeetingDetailsRepositoryImpl implements MeetingDetailsLocalRepository {

  final MeetingLocalDataSource saveMeetingLocalDataSource;

  const MeetingDetailsRepositoryImpl({required this.saveMeetingLocalDataSource});

  @override
  Future<Either<Failure, Unit>> saveMeetingDetails(MeetingDetailModel meetingDetailModel) async {
    try {
      final response = await saveMeetingLocalDataSource.saveMeetingDetails(
          MeetingDetailModel(
              meetingDetailModel.meetingID,
              meetingDetailModel.meetingPlace,
              meetingDetailModel.meetingDateTime,
              meetingDetailModel.totalNoItems,
              meetingDetailModel.ministerNameHindi,
              meetingDetailModel.minDesignameForProceedings,
              meetingDetailModel.imageMinister));
      return Right(response);
    } on ConnectionException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<MeetingDetailModel>>> getMeetingDetails()  async {
    try{
      final response = await saveMeetingLocalDataSource.getMeetingDetails();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }
}
