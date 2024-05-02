import 'package:hive/hive.dart';

part 'meeting_details_hive_model.g.dart';

@HiveType(typeId: 0)
class MeetingDetailHiveModel extends HiveObject {

  @HiveField(1)
  String? meetingID;

  @HiveField(2)
  String? meetingPlace;

  @HiveField(3)
  String? meetingDateTime;

  @HiveField(4)
  String? totalNoItems;

  @HiveField(5)
  String? ministerNameHindi;

  @HiveField(6)
  String? minDesignameForProceedings;

  @HiveField(7)
  String? imageMinister;

  MeetingDetailHiveModel(
      {required this.meetingID,
        required this.meetingPlace,
        required this.meetingDateTime,
        required this.totalNoItems,
        required this.ministerNameHindi,
        required this.minDesignameForProceedings,
        required this.imageMinister});
}