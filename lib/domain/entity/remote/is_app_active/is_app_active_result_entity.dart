import 'package:emantrimandal/data/model/is_app_active/is_app_active_result_model.dart';

class IsAppActiveResult {
  IsAppActiveResult({
    this.id,
    this.app,
    this.description,
    this.apptype,
    this.updatedate,
    this.active,
    this.version, this.app_status});

  IsAppActiveResult.fromJson(dynamic json) {
    id = json['i_d'];
    app = json['appname'];
    description = json['descr'];
    apptype = json['apptype'];
    updatedate = json['update_date'];
    active = json['active_'];
    version = json['version_name'];
    app_status = json['app_status'];
  }

  int? id;
  String? app;
  String? description;
  String? apptype;

  String? updatedate;
  String? active;
  String? version;
  String? app_status;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['i_d'] = id;
    map['appname'] = app;
    map['descr'] = description;
    map['apptype'] = apptype;
    map['update_date'] = updatedate;
    map['active_'] = active;
    map['version_name'] = version;
    map['app_status'] = app_status;

    return map;
  }

  Result toModel() =>
      Result(
          i_d: id!,
          appname: app!,
          descr: description!,
          updateDate: updatedate!,
          active: active!,
          versionName: version!,
          apptype: apptype!,
          appStatus: app_status!);

}