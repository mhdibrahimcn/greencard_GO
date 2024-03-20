import 'package:green/models/StudentDetail_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const STUDENT_DB_NAME = "student-database";

abstract class studentDbFunctions {
  Future<void> insertStudentDetails(StudentsDetailModel value);
}

class studentDb extends studentDbFunctions {
  @override
  Future<void> insertStudentDetails(StudentsDetailModel value) async {
    final student_db = await Hive.openBox(STUDENT_DB_NAME);
    student_db.put(value.studentid, value);
  }
}
