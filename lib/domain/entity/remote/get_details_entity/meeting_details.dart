import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';

class MeetingDetail {
  MeetingDetail({
    this.meetingID,
    this.meetingPlace,
    this.meetingDateTime,
    this.totalNoItems,
    this.ministerNameHindi,
    this.minDesignameForProceedings,
    this.imageMinister,});

  MeetingDetail.fromJson(dynamic json) {
    meetingID = json['MeetingID'];
    meetingPlace = json['meetingPlace'];
    meetingDateTime = json['meetingDateTime'];
    totalNoItems = json['Total_No_items'];
    ministerNameHindi = json['ministerNameHindi'];
    minDesignameForProceedings = json['minDesignameForProceedings'];
    imageMinister = json['ImageMinister'];
  }
  String? meetingID;
  String? meetingPlace;
  String? meetingDateTime;
  String? totalNoItems;
  String? ministerNameHindi;
  String? minDesignameForProceedings;
  String? imageMinister;
  MeetingDetail copyWith({  String? meetingID,
    String? meetingPlace,
    String? meetingDateTime,
    String? totalNoItems,
    String? ministerNameHindi,
    String? minDesignameForProceedings,
    String? imageMinister,
  }) => MeetingDetail(  meetingID: meetingID ?? this.meetingID,
    meetingPlace: meetingPlace ?? this.meetingPlace,
    meetingDateTime: meetingDateTime ?? this.meetingDateTime,
    totalNoItems: totalNoItems ?? this.totalNoItems,
    ministerNameHindi: ministerNameHindi ?? this.ministerNameHindi,
    minDesignameForProceedings: minDesignameForProceedings ?? this.minDesignameForProceedings,
    imageMinister: imageMinister ?? this.imageMinister,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MeetingID'] = meetingID;
    map['meetingPlace'] = meetingPlace;
    map['meetingDateTime'] = meetingDateTime;
    map['Total_No_items'] = totalNoItems;
    map['ministerNameHindi'] = ministerNameHindi;
    map['minDesignameForProceedings'] = minDesignameForProceedings;
    map['ImageMinister'] = imageMinister;
    return map;
  }

  MeetingDetailModel toModel()  => MeetingDetailModel(meetingID, meetingPlace, meetingDateTime, totalNoItems, ministerNameHindi, minDesignameForProceedings, imageMinister);


}