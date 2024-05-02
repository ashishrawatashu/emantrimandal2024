class LogoutEntity {
  LogoutEntity({
      this.code, 
      this.logoutStatus, 
      this.msg,});

  LogoutEntity.fromJson(dynamic json) {
    code = json['code'];
    logoutStatus = json['Logout Status'];
    msg = json['msg'];
  }
  String? code;
  String? logoutStatus;
  String? msg;
LogoutEntity copyWith({  String? code,
  String? logoutStatus,
  String? msg,
}) => LogoutEntity(  code: code ?? this.code,
  logoutStatus: logoutStatus ?? this.logoutStatus,
  msg: msg ?? this.msg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['Logout Status'] = logoutStatus;
    map['msg'] = msg;
    return map;
  }

}