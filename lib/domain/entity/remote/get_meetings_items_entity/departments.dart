import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';

class Departments {
  Departments({
    this.deptID,
    this.deptName,
    this.minister,
    this.noOfItems});

  Departments.fromJson(dynamic json) {
    deptID = json['Dept_ID'];
    deptName = json['Dept_name'];
    minister = json['Minister'];
    noOfItems = json['No_of_items'];
  }
  String? deptID;
  String? deptName;
  String? minister;
  num? noOfItems;
  Departments copyWith({  String? deptID,
    String? deptName,
    String? minister,
    num? noOfItems,
    num? updatedNoOfItems,

  }) => Departments(  deptID: deptID ?? this.deptID,
    deptName: deptName ?? this.deptName,
    minister: minister ?? this.minister,
    noOfItems: noOfItems ?? this.noOfItems,

  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Dept_ID'] = deptID;
    map['Dept_name'] = deptName;
    map['Minister'] = minister;
    map['No_of_items'] = noOfItems;
    return map;
  }


  DepartmentsModel toModel()  => DepartmentsModel(deptID: deptID, deptName: deptName, minister: minister, noOfItems: noOfItems);

}