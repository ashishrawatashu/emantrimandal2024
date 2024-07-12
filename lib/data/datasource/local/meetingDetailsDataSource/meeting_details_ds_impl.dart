import 'package:dartz/dartz.dart';
import 'package:emantrimandal/data/datasource/local/meetingDetailsDataSource/meeting_details_data_source.dart';
import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';
import 'package:emantrimandal/domain/entity/local/meetingDetailsModel/meeting_details_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';

import '../../../../core/error/exceptions.dart';

class SaveMeetingLocalDsImpl implements MeetingLocalDataSource {
  final _kSaveMeetingBox = 'meeting_box';

  @override
  Future<Unit> saveMeetingDetails(MeetingDetailModel meetingDetailModel) async {
    try {
      final meetingBox = Hive.box<MeetingDetailHiveModel>(_kSaveMeetingBox);
      bool meetingIDExists = false;
      for (var i = 0; i < meetingBox.length; i++) {
        final task = meetingBox.getAt(i);
        if (task!.meetingID == meetingDetailModel.meetingID) {
          meetingIDExists = true;
          break;
        }
      }
      if (!meetingIDExists) {
        // No item with the same meetingID exists, so add the data
        final convertedTask = MeetingDetailHiveModel(
          meetingID: meetingDetailModel.meetingID,
          meetingPlace: meetingDetailModel.meetingPlace,
          meetingDateTime: meetingDetailModel.meetingDateTime,
          totalNoItems: meetingDetailModel.totalNoItems,
          ministerNameHindi: meetingDetailModel.ministerNameHindi,
          minDesignameForProceedings: meetingDetailModel.minDesignameForProceedings,
          imageMinister: meetingDetailModel.imageMinister,
        );

        await meetingBox.add(convertedTask);
        return Future.value(unit);
      } else {
        return Future.value(null);
      }



    } catch (_) {
      throw ConnectionException();
    }
  }



  @override
  Future<Unit> deleteAllMeeting() {
    // TODO: implement deleteAllMeeting
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteMeetingById(String meetingId) {
    // TODO: implement deleteMeetingById
    throw UnimplementedError();
  }

  @override
  Future<List<MeetingDetailModel>> getMeetingDetails() async {
    try {
      final meetingBox = Hive.box<MeetingDetailHiveModel>(_kSaveMeetingBox);
      final result = meetingBox.values
          .map<MeetingDetailModel>((e) => MeetingDetailModel(
          e.meetingID, e.meetingPlace,e. meetingDateTime, e.totalNoItems,e. ministerNameHindi, e.minDesignameForProceedings, e.imageMinister))
          .toList();
      return result;
    } catch (_) {
      throw NoDataException();
    }
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      Hive.registerAdapter(MeetingDetailHiveModelAdapter());
      await Hive.openBox<MeetingDetailHiveModel>(_kSaveMeetingBox);
      return true;
    } catch (_) {
      throw ConnectionException();
    }
  }
}
