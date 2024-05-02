
import '../../../../data/model/is_app_active/is_app_active_model.dart';
import 'help_desk_entity.dart';
import 'is_app_active_result_entity.dart';

class IsAppActive {

  IsAppActive({this.code, this.result, this.helpdek, this.msg,});
  IsAppActive.fromJson(dynamic json) {
    code = json['code'];
    if (json['Result'] != null) {
      result = [];
      json['Result'].forEach((v) {
        result?.add(IsAppActiveResult.fromJson(v));
      });
    }
    if (json['Helpdesk'] != null) {
      helpdek = [];
      json['Helpdesk'].forEach((v) {
        helpdek?.add(Helpdek.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<IsAppActiveResult>? result;
  List<Helpdek>? helpdek;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (result != null) {
      map['Result'] = result?.map((v) => v.toJson()).toList();
    }
    if (helpdek != null) {
      map['Helpdesk'] = helpdek?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

  IsAppActiveModel toModel() => IsAppActiveModel(
      code: code!,
      result: this.result != null
          ? this.result?.map((e) => e.toModel()).toList()
          : [],
      helpdesk: this.helpdek != null
          ? this.helpdek?.map((e) => e.toModel()).toList()
          : [],
      msg: msg!);

}
