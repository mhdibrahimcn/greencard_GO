import 'package:hive_flutter/hive_flutter.dart';
part 'StudentDetail_model.g.dart';

@HiveType(typeId: 2)
enum periodtime {
  @HiveField(0)
  onemonth,

  @HiveField(1)
  threemonths,
}

@HiveType(typeId: 1)
class StudentsDetailModel {
  @HiveField(0)
  final String studentid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String institution;

  @HiveField(3)
  final DateTime dob;

  @HiveField(4)
  final String gurdianName;

  @HiveField(5)
  final String aadharNo;

  @HiveField(6)
  final String startingDestination;

  @HiveField(7)
  final String endingDestination;

  @HiveField(8)
  final periodtime period;

  @HiveField(9)
  final String deponame;

  @HiveField(10)
  final String distict;

  @HiveField(11)
  final String city;

  @HiveField(12)
  final String pincode;

  StudentsDetailModel(
      {required this.studentid,
      required this.name,
      required this.institution,
      required this.dob,
      required this.gurdianName,
      required this.aadharNo,
      required this.startingDestination,
      required this.endingDestination,
      required this.period,
      required this.deponame,
      required this.distict,
      required this.city,
      required this.pincode});
}
