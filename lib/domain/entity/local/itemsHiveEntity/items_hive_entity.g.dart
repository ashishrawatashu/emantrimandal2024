// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsHiveEntityAdapter extends TypeAdapter<ItemsHiveEntity> {
  @override
  final int typeId = 2;

  @override
  ItemsHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsHiveEntity(
      itemID: fields[0] as num?,
      deptID: fields[1] as String?,
      briefSubject: fields[2] as String?,
      detailedSubject: fields[3] as String?,
      fileNumber: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsHiveEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.itemID)
      ..writeByte(1)
      ..write(obj.deptID)
      ..writeByte(2)
      ..write(obj.briefSubject)
      ..writeByte(3)
      ..write(obj.detailedSubject)
      ..writeByte(4)
      ..write(obj.fileNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
