import 'package:hive/hive.dart';
part 'departments_hive_entity.g.dart';

@HiveType(typeId: 1)
class DepartmentsHiveEntity  extends HiveObject {

  @HiveField(0)
  String? deptID;

  @HiveField(1)
  String? deptName;

  @HiveField(2)
  String? minister;

  @HiveField(3)
  num? noOfItems;

  DepartmentsHiveEntity({required this.deptID, required this.deptName, required this.minister, required this.noOfItems});

}