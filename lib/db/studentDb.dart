import 'package:green/models/StudentDetail_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const STUDENT_DB_NAME = "student-database";

abstract class studentDbFunctions {
  Future<void> insertStudentDetails(StudentsDetailModel value);
  Future<List<StudentsDetailModel>> getStudentDetails();
}

class studentDb extends studentDbFunctions {
  studentDb._internal();
  static studentDb instance = studentDb._internal();
  factory studentDb() {
    return instance;
  }

  @override
  Future<void> insertStudentDetails(StudentsDetailModel value) async {
    final student_db = await Hive.openBox(STUDENT_DB_NAME);
    student_db.put(value.studentid, value);
  }

  @override
  Future<List<StudentsDetailModel>> getStudentDetails() async {
    final student_db = await Hive.openBox<StudentsDetailModel>(STUDENT_DB_NAME);

    return student_db.values.toList();
  }
}
