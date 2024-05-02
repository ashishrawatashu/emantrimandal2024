class GetMeetingItemsParams {
  String? MAC;
  String? token;

  GetMeetingItemsParams({
    required this.MAC,
    required this.token,
  });

  GetMeetingItemsParams.fromJson(Map<String, dynamic> json) {
    MAC = json['MAC'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MAC'] = MAC;
    _data['token'] = token;
    return _data;
  }

}
