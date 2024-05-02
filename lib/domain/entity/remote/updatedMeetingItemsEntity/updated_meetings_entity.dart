import 'package:emantrimandal/domain/entity/remote/updatedMeetingItemsEntity/updated_departments_entity.dart';
import 'package:emantrimandal/domain/entity/remote/updatedMeetingItemsEntity/updated_details.dart';

import 'updated_items.dart';

class UpdatedMeetingsEntity {
  UpdatedMeetingsEntity({
      this.code, 
      this.departments, 
      this.items, 
      this.itemsDetails, 
      this.msg,});

  UpdatedMeetingsEntity.fromJson(dynamic json) {
    code = json['code'];
    if (json['Departments'] != null) {
      departments = [];
      json['Departments'].forEach((v) {
        departments?.add(UpdatedDepartments.fromJson(v));
      });
    }
    if (json['Items'] != null) {
      items = [];
      json['Items'].forEach((v) {
        items?.add(UpdatedItems.fromJson(v));
      });
    }
    if (json['ItemsDetails'] != null) {
      itemsDetails = [];
      json['ItemsDetails'].forEach((v) {
        itemsDetails?.add(UpdatedItemsDetails.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<UpdatedDepartments>? departments;
  List<UpdatedItems>? items;
  List<UpdatedItemsDetails>? itemsDetails;
  String? msg;
  UpdatedMeetingsEntity copyWith({  String? code,
  List<UpdatedDepartments>? departments,
  List<UpdatedItems>? items,
  List<UpdatedItemsDetails>? itemsDetails,
  String? msg,
}) => UpdatedMeetingsEntity(  code: code ?? this.code,
  departments: departments ?? this.departments,
  items: items ?? this.items,
  itemsDetails: itemsDetails ?? this.itemsDetails,
  msg: msg ?? this.msg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (departments != null) {
      map['Departments'] = departments?.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      map['Items'] = items?.map((v) => v.toJson()).toList();
    }
    if (itemsDetails != null) {
      map['ItemsDetails'] = itemsDetails?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

}





