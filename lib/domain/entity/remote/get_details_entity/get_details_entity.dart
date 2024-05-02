import 'package:emantrimandal/data/model/getDetailsModel/get_details_model.dart';

import 'meeting_details.dart';

class GetDetailsEntity {
  GetDetailsEntity({
    this.code,
    this.meetingDetail,
    this.msg,
  });

  GetDetailsEntity.fromJson(dynamic json) {
    code = json['code'];
    if (json['MeetingDetail'] != null) {
      meetingDetail = [];
      json['MeetingDetail'].forEach((v) {
        meetingDetail?.add(MeetingDetail.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  String? code;
  List<MeetingDetail>? meetingDetail;
  String? msg;

  GetDetailsEntity copyWith({
    String? code,
    List<MeetingDetail>? meetingDetail,
    String? msg,
  }) =>
      GetDetailsEntity(
        code: code ?? this.code,
        meetingDetail: meetingDetail ?? this.meetingDetail,
        msg: msg ?? this.msg,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (meetingDetail != null) {
      map['MeetingDetail'] = meetingDetail?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

  GetDetailsModel toModel() => GetDetailsModel(code: code,
      meetingDetail: this.meetingDetail != null
      ? this.meetingDetail?.map((e) => e.toModel()).toList()
      : [],
      msg: msg);
}
