import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';

class Items {
  Items({
    this.itemID,
    this.deptID,
    this.briefSubject,
    this.detailedSubject,
    this.fileNumber,
  });

  Items.fromJson(dynamic json) {
    itemID = json['ItemID'];
    deptID = json['Dept_ID'];
    briefSubject = json['Brief_Subject'];
    detailedSubject = json['Detailed_Subject'];
    fileNumber = json['fileNumber'];
  }

  num? itemID;
  String? deptID;
  String? briefSubject;
  String? detailedSubject;
  String? fileNumber;

  Items copyWith({
    num? itemID,
    String? deptID,
    String? briefSubject,
    String? detailedSubject,
    String? fileNumber,
  }) =>
      Items(
        itemID: itemID ?? this.itemID,
        deptID: deptID ?? this.deptID,
        briefSubject: briefSubject ?? this.briefSubject,
        detailedSubject: detailedSubject ?? this.detailedSubject,
        fileNumber: fileNumber ?? this.fileNumber,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ItemID'] = itemID;
    map['Dept_ID'] = deptID;
    map['Brief_Subject'] = briefSubject;
    map['Detailed_Subject'] = detailedSubject;
    map['fileNumber'] = fileNumber;
    return map;
  }

  ItemsModel toModel() => ItemsModel(
      itemID: itemID,
      deptID: deptID,
      briefSubject: briefSubject,
      detailedSubject: detailedSubject,
      fileNumber: fileNumber);
}
