// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_details_hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsDetailsHiveEntityAdapter
    extends TypeAdapter<ItemsDetailsHiveEntity> {
  @override
  final int typeId = 3;

  @override
  ItemsDetailsHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsDetailsHiveEntity(
      itemId: fields[0] as String?,
      itemsDetails: fields[1] as String?,
      fileApprovedNote: fields[2] as String?,
      fileEnclosure: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsDetailsHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.itemId)
      ..writeByte(1)
      ..write(obj.itemsDetails)
      ..writeByte(2)
      ..write(obj.fileApprovedNote)
      ..writeByte(3)
      ..write(obj.fileEnclosure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsDetailsHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
