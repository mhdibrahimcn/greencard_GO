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
      studentid: fields[0] as String,
      name: fields[1] as String,
      institution: fields[2] as String,
      dob: fields[3] as DateTime,
      gurdianName: fields[4] as String,
      aadharNo: fields[5] as String,
      startingDestination: fields[6] as String,
      endingDestination: fields[7] as String,
      period: fields[8] as periodtime,
      deponame: fields[9] as String,
      distict: fields[10] as String,
      city: fields[11] as String,
      pincode: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentsDetailModel obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.startingDestination)
      ..writeByte(7)
      ..write(obj.endingDestination)
      ..writeByte(8)
      ..write(obj.period)
      ..writeByte(9)
      ..write(obj.deponame)
      ..writeByte(10)
      ..write(obj.distict)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.pincode);
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

class periodtimeAdapter extends TypeAdapter<periodtime> {
  @override
  final int typeId = 2;

  @override
  periodtime read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return periodtime.onemonth;
      case 1:
        return periodtime.threemonths;
      default:
        return periodtime.onemonth;
    }
  }

  @override
  void write(BinaryWriter writer, periodtime obj) {
    switch (obj) {
      case periodtime.onemonth:
        writer.writeByte(0);
        break;
      case periodtime.threemonths:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is periodtimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
