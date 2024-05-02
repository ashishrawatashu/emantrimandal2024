import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';

class ItemsDetails {
  ItemsDetails({
    this.itemId,
    this.itemsDetails,
    this.fileApprovedNote,
    this.fileEnclosure,});

  ItemsDetails.fromJson(dynamic json) {
    itemId = json['Item_Id'];
    itemsDetails = json['Items_details'];
    fileApprovedNote = json['File_Approved_Note'];
    fileEnclosure = json['File_Enclosure'];
  }
  String? itemId;
  String? itemsDetails;
  String? fileApprovedNote;
  String? fileEnclosure;
  ItemsDetails copyWith({  String? itemId,
    String? itemsDetails,
    String? fileApprovedNote,
    String? fileEnclosure,
  }) => ItemsDetails(  itemId: itemId ?? this.itemId,
    itemsDetails: itemsDetails ?? this.itemsDetails,
    fileApprovedNote: fileApprovedNote ?? this.fileApprovedNote,
    fileEnclosure: fileEnclosure ?? this.fileEnclosure,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_Id'] = itemId;
    map['Items_details'] = itemsDetails;
    map['File_Approved_Note'] = fileApprovedNote;
    map['File_Enclosure'] = fileEnclosure;
    return map;
  }

  ItemsDetailsModel toModel() => ItemsDetailsModel(itemId: itemId, itemsDetails: itemsDetails, fileApprovedNote: fileApprovedNote, fileEnclosure: fileEnclosure);

}