// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentDetail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentsDetailModelAdapter extends TypeAdapter<StudentsDetailModel> {
  @override
  final int typeId = 1;

  @override
  StudentsDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentsDetailModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as int,
      fields[6] as String,
      fields[7] as int,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
      fields[14] as String,
      fields[15] as int,
      fields[16] as String,
      fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentsDetailModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.studentid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.institution)
      ..writeByte(3)
      ..write(obj.dob)
      ..writeByte(4)
      ..write(obj.gurdianName)
      ..writeByte(5)
      ..write(obj.aadharNo)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.password)
      ..writeByte(9)
      ..write(obj.startingDestination)
      ..writeByte(10)
      ..write(obj.endingDestination)
      ..writeByte(11)
      ..write(obj.period)
      ..writeByte(12)
      ..write(obj.deponame)
      ..writeByte(13)
      ..write(obj.distict)
      ..writeByte(14)
      ..write(obj.city)
      ..writeByte(15)
      ..write(obj.pincode)
      ..writeByte(16)
      ..write(obj.ticketStartingDate)
      ..writeByte(17)
      ..write(obj.ticketEndingDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
