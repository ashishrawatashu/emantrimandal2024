import 'package:emantrimandal/data/model/generateToken/token_details_model.dart';

class GenerateTokenModel {
  String? code;
  List<TokenDetailsModel>? tokenDetails;
  String? msg;

  GenerateTokenModel({this.code, this.tokenDetails, this.msg});

}