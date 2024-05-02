import 'package:hive/hive.dart';

part 'items_details_hive_entity.g.dart';

@HiveType(typeId: 3)
class ItemsDetailsHiveEntity extends HiveObject {
  @HiveField(0)
  String? itemId;

  @HiveField(1)
  String? itemsDetails;

  @HiveField(2)
  String? fileApprovedNote;

  @HiveField(3)
  String? fileEnclosure;

  ItemsDetailsHiveEntity(
      {required this.itemId,
      required this.itemsDetails,
      required this.fileApprovedNote,
      required this.fileEnclosure});
}
