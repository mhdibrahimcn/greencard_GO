// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Studentlogin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudendloginModelAdapter extends TypeAdapter<StudendloginModel> {
  @override
  final int typeId = 3;

  @override
  StudendloginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudendloginModel(
      studentid: fields[0] as String,
      email: fields[1] as String,
      phoneNumber: fields[2] as int,
      password: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudendloginModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.studentid)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudendloginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
