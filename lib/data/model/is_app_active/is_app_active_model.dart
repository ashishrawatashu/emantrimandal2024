import 'help_desk_model.dart';
import 'is_app_active_result_model.dart';

class IsAppActiveModel {
  String? code;
  List<Result>? result;
  List<Helpdesk>? helpdesk;
  String? msg;

  IsAppActiveModel({
    this.code,
    this.result,
    this.helpdesk,
    this.msg,
  });

}