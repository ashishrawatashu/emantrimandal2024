// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_details_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeetingDetailHiveModelAdapter
    extends TypeAdapter<MeetingDetailHiveModel> {
  @override
  final int typeId = 0;

  @override
  MeetingDetailHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeetingDetailHiveModel(
      meetingID: fields[1] as String?,
      meetingPlace: fields[2] as String?,
      meetingDateTime: fields[3] as String?,
      totalNoItems: fields[4] as String?,
      ministerNameHindi: fields[5] as String?,
      minDesignameForProceedings: fields[6] as String?,
      imageMinister: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MeetingDetailHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.meetingID)
      ..writeByte(2)
      ..write(obj.meetingPlace)
      ..writeByte(3)
      ..write(obj.meetingDateTime)
      ..writeByte(4)
      ..write(obj.totalNoItems)
      ..writeByte(5)
      ..write(obj.ministerNameHindi)
      ..writeByte(6)
      ..write(obj.minDesignameForProceedings)
      ..writeByte(7)
      ..write(obj.imageMinister);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeetingDetailHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
