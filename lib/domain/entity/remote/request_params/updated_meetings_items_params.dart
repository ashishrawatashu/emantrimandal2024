class UpdatedMeetingItemsParams {
  String? DeptId;
  String? TotalItems;
  String? MAC;
  String? token;

  UpdatedMeetingItemsParams({
    required this.DeptId,
    required this.TotalItems,
    required this.MAC,
    required this.token,
  });

  UpdatedMeetingItemsParams.fromJson(Map<String, dynamic> json) {
    DeptId = json['DeptId'];
    TotalItems = json['TotalItems'];
    MAC = json['MAC'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['DeptId'] = DeptId;
    _data['TotalItems'] = TotalItems;
    _data['MAC'] = MAC;
    _data['token'] = token;
    return _data;
  }

}
