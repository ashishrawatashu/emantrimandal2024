import 'package:emantrimandal/data/model/generateToken/token_details_model.dart';

class TokenDetails {
  TokenDetails({
    required this.token,
    required this.tokenExpiryDateTime,
  });

  TokenDetails.fromJson(dynamic json) {
    token = json['Token'];
    tokenExpiryDateTime = json['TokenExpiryDateTime'];
  }

  String? token;
  String? tokenExpiryDateTime;

  TokenDetails copyWith({
    String? token,
    String? tokenExpiryDateTime,
  }) =>
      TokenDetails(
        token: token ?? this.token,
        tokenExpiryDateTime: tokenExpiryDateTime ?? this.tokenExpiryDateTime,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Token'] = token;
    map['TokenExpiryDateTime'] = tokenExpiryDateTime;
    return map;
  }

  TokenDetailsModel toModel() =>
      TokenDetailsModel(token: token, tokenExpiryDateTime: tokenExpiryDateTime);
}
