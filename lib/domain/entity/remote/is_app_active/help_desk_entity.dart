

import 'package:emantrimandal/data/model/is_app_active/help_desk_model.dart';

class Helpdek {
  Helpdek({
    this.mobileNo,
    this.emailId,});

  Helpdek.fromJson(dynamic json) {
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
  }
  String? mobileNo;
  String? emailId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNo'] = mobileNo;
    map['emailId'] = emailId;
    return map;
  }

  Helpdesk toModel() => Helpdesk(mobileNo: mobileNo!, emailId: emailId!);

}