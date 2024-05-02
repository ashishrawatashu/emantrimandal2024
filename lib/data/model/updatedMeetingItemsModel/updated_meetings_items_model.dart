import 'package:emantrimandal/data/model/updatedMeetingItemsModel/updated_departments_model.dart';
import 'package:emantrimandal/data/model/updatedMeetingItemsModel/updated_items_details_model.dart';
import 'package:emantrimandal/data/model/updatedMeetingItemsModel/updated_items_model.dart';


class UpdatedMeetingsItemsModel {
  UpdatedMeetingsItemsModel({
    this.code,
    this.departments,
    this.items,
    this.itemsDetails,
    this.msg,});


  String? code;
  List<UpdatedDepartmentsModel>? departments;
  List<UpdatedItemsModel>? items;
  List<UpdatedItemsDetailsModel>? itemsDetails;
  String? msg;


}





