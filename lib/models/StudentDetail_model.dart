import 'package:hive_flutter/hive_flutter.dart';
part 'StudentDetail_model.g.dart';

@HiveType(typeId: 1)
class StudentsDetailModel {
  @HiveField(0)
  final String studentid;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? institution;

  @HiveField(3)
  final String? dob;

  @HiveField(4)
  final String gurdianName;

  @HiveField(5)
  final int aadharNo;

  @HiveField(6)
  final String email;

  @HiveField(7)
  final int phoneNumber;

  @HiveField(8)
  final String password;

  @HiveField(9)
  final String startingDestination;

  @HiveField(10)
  final String endingDestination;

  @HiveField(11)
  final String period;

  @HiveField(12)
  final String deponame;

  @HiveField(13)
  final String distict;

  @HiveField(14)
  final String city;

  @HiveField(15)
  final int pincode;

  StudentsDetailModel(
      this.studentid,
      this.name,
      this.institution,
      this.dob,
      this.gurdianName,
      this.aadharNo,
      this.email,
      this.phoneNumber,
      this.password,
      this.startingDestination,
      this.endingDestination,
      this.period,
      this.deponame,
      this.distict,
      this.city,
      this.pincode);
}
