import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/domain/entity/remote/generate_token_entity/token_details.dart';

class GenerateTokenEntity {
  GenerateTokenEntity({
    required this.code,
    required this.tokenDetails,
    required this.msg,
  });

  GenerateTokenEntity.fromJson(dynamic json) {
    code = json['code'];
    if (json['Token Details'] != null) {
      tokenDetails = [];
      json['Token Details'].forEach((v) {
        tokenDetails?.add(TokenDetails.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  String? code;
  List<TokenDetails>? tokenDetails;
  String? msg;

  GenerateTokenEntity copyWith({
    String? code,
    List<TokenDetails>? tokenDetails,
    String? msg,
  }) =>
      GenerateTokenEntity(
        code: code ?? this.code,
        tokenDetails: tokenDetails ?? this.tokenDetails,
        msg: msg ?? this.msg,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (tokenDetails != null) {
      map['Token Details'] = tokenDetails?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

  GenerateTokenModel toModel() => GenerateTokenModel(
      code: code,
      tokenDetails: this.tokenDetails != null
          ? this.tokenDetails?.map((e) => e.toModel()).toList()
          : [],
      msg: msg);
}
