class LogOutParams {
  String? MAC;
  String? MACKey;
  String? Lat;
  String? Longt;
  String? Token;

  LogOutParams({
    required this.MAC,
    required this.MACKey,
    required this.Lat,
    required this.Longt,
    required this.Token,
  });

  LogOutParams.fromJson(Map<String, dynamic> json) {
    MAC = json['MAC'];
    MACKey = json['MACKey'];
    Lat = json['Lat'];
    Longt = json['Longt'];
    Token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MAC'] = MAC;
    _data['MACKey'] = MACKey;
    _data['Lat'] = Lat;
    _data['Longt'] = Longt;
    _data['Token'] = Token;
    return _data;
  }

}