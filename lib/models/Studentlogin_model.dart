import 'package:hive_flutter/hive_flutter.dart';
part 'Studentlogin_model.g.dart';

@HiveType(typeId: 3)
class StudendloginModel {
  @HiveField(0)
  final String studentid;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final int phoneNumber;

  @HiveField(3)
  final String password;

  StudendloginModel(
      {required this.studentid,
      required this.email,
      required this.phoneNumber,
      required this.password});
}
