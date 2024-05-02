class UpdatedDepartments {
  UpdatedDepartments({
    this.deptID,
    this.deptName,
    this.minister,
    this.noOfItems,
    this.updatedNoOfItems});

  UpdatedDepartments.fromJson(dynamic json) {
    deptID = json['Dept_ID'];
    deptName = json['Dept_name'];
    minister = json['Minister'];
    noOfItems = json['No_of_items'];
    updatedNoOfItems = json['Updated_No_of_items'];
  }
  String? deptID;
  String? deptName;
  String? minister;
  num? noOfItems;
  num? updatedNoOfItems;
  UpdatedDepartments copyWith({  String? deptID,
    String? deptName,
    String? minister,
    num? noOfItems,
    num? updatedNoOfItems,

  }) => UpdatedDepartments(  deptID: deptID ?? this.deptID,
    deptName: deptName ?? this.deptName,
    minister: minister ?? this.minister,
    noOfItems: noOfItems ?? this.noOfItems,
    updatedNoOfItems: updatedNoOfItems ?? this.updatedNoOfItems,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Dept_ID'] = deptID;
    map['Dept_name'] = deptName;
    map['Minister'] = minister;
    map['No_of_items'] = noOfItems;
    map['Updated_No_of_items'] = updatedNoOfItems;
    return map;
  }

}