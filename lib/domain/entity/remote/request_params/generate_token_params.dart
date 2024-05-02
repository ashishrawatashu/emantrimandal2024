class GenerateTokenParams {

  String? MACUID;
  String? MACKey;
  String? Lat;
  String? Longt;

  GenerateTokenParams({required this.MACUID, required this.MACKey,required this.Lat,required this.Longt});


  GenerateTokenParams.fromJson(Map<String, dynamic> json) {
    MACUID = json['MACUID'];
    MACKey = json['MACKey'];
    Lat = json['Lat'];
    Longt = json['Longt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MACUID'] = MACUID;
    _data['MACKey'] = MACKey;
    _data['Lat'] = Lat;
    _data['Longt'] = Longt;
    return _data;
  }
}