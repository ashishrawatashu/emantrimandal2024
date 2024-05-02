import 'package:hive/hive.dart';
part 'items_hive_entity.g.dart';

@HiveType(typeId: 2)
class ItemsHiveEntity extends HiveObject{

  @HiveField(0)
  num? itemID;

  @HiveField(1)
  String? deptID;

  @HiveField(2)
  String? briefSubject;

  @HiveField(3)
  String? detailedSubject;

  @HiveField(4)
  String? fileNumber;

  ItemsHiveEntity({this.itemID, this.deptID, this.briefSubject,
      this.detailedSubject, this.fileNumber});
}