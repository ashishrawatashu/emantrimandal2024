import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';

import 'departments.dart';
import 'items.dart';
import 'items_details.dart';

class GetMeetingsEntity {
  GetMeetingsEntity({
    this.code,
    this.departments,
    this.items,
    this.itemsDetails,
    this.msg,
  });

  GetMeetingsEntity.fromJson(dynamic json) {
    code = json['code'];
    if (json['Departments'] != null) {
      departments = [];
      json['Departments'].forEach((v) {
        departments?.add(Departments.fromJson(v));
      });
    }
    if (json['Items'] != null) {
      items = [];
      json['Items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    if (json['ItemsDetails'] != null) {
      itemsDetails = [];
      json['ItemsDetails'].forEach((v) {
        itemsDetails?.add(ItemsDetails.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  String? code;
  List<Departments>? departments;
  List<Items>? items;
  List<ItemsDetails>? itemsDetails;
  String? msg;

  GetMeetingsEntity copyWith({
    String? code,
    List<Departments>? departments,
    List<Items>? items,
    List<ItemsDetails>? itemsDetails,
    String? msg,
  }) =>
      GetMeetingsEntity(
        code: code ?? this.code,
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

  GetMeetingsItemsModel toModel() => GetMeetingsItemsModel(
      code: code,
      departments: this.departments != null
          ? this.departments?.map((e) => e.toModel()).toList()
          : [],
      items: this.items != null
          ? this.items?.map((e) => e.toModel()).toList()
          : [],
      itemsDetails: this.itemsDetails != null
          ? this.itemsDetails?.map((e) => e.toModel()).toList()
          : [],
      msg: msg);
}
