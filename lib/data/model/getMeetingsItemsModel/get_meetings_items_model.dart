import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';


class GetMeetingsItemsModel {
  GetMeetingsItemsModel({
    this.code,
    this.departments,
    this.items,
    this.itemsDetails,
    this.msg,});


  String? code;
  List<DepartmentsModel>? departments;
  List<ItemsModel>? items;
  List<ItemsDetailsModel>? itemsDetails;
  String? msg;


}





