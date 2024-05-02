class GetDetailsParams {


  String? MAC;
  String? Token;
  String? MACKey;
  String? Lat;
  String? Longt;

  GetDetailsParams({required this.MAC, required this.Token,required this.MACKey,required this.Lat, required this.Longt});


  GetDetailsParams.fromJson(Map<String, dynamic> json) {
    MAC = json['MAC'];
    Token = json['Token'];
    MACKey = json['MACKey'];
    Lat = json['Lat'];
    Longt = json['Longt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MAC'] = MAC;
    _data['Token'] = Token;
    _data['MACKey'] = MACKey;
    _data['Lat'] = Lat;
    _data['Longt'] = Longt;
    return _data;
  }
}