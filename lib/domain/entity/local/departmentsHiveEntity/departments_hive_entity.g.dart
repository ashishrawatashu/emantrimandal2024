// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepartmentsHiveEntityAdapter extends TypeAdapter<DepartmentsHiveEntity> {
  @override
  final int typeId = 1;

  @override
  DepartmentsHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepartmentsHiveEntity(
      deptID: fields[0] as String?,
      deptName: fields[1] as String?,
      minister: fields[2] as String?,
      noOfItems: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, DepartmentsHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.deptID)
      ..writeByte(1)
      ..write(obj.deptName)
      ..writeByte(2)
      ..write(obj.minister)
      ..writeByte(3)
      ..write(obj.noOfItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartmentsHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
