// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentTravelHistory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentTravelHistorymodelAdapter
    extends TypeAdapter<StudentTravelHistory_model> {
  @override
  final int typeId = 2;

  @override
  StudentTravelHistory_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentTravelHistory_model(
      travelId: fields[0] as String,
      travelStatus: fields[1] as String,
      travelDate: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, StudentTravelHistory_model obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.travelId)
      ..writeByte(1)
      ..write(obj.travelStatus)
      ..writeByte(2)
      ..write(obj.travelDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentTravelHistorymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
