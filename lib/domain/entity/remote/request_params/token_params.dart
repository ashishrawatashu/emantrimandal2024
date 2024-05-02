class TokenParams {
  String? token;

  TokenParams({
    required this.token
  });

  TokenParams.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    return _data;
  }

}
