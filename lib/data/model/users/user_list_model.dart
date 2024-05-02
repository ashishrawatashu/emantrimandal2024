import 'package:emantrimandal/data/model/users/support_model.dart';


import 'data_model.dart';

class UserListModel {
  num? page;
  num? perPage;
  num? total;
  num? totalPages;
  List<DataModel>? data;
  SupportModel? support;

  UserListModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });
}
