import 'package:green/models/StudentDetail_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const STUDENT_DB_NAME = "student-database";

abstract class studentDbFunctions {
  Future<void> insertStudentDetails(StudentsDetailModel value);
  Future<List<StudentsDetailModel>> getStudentDetails();
  Future<void> closeStdDb();
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

  @override
  Future<void> closeStdDb() async {
    final student_db = await Hive.openBox(STUDENT_DB_NAME);
    student_db.close();
  }
  // Add this method to your studentDb class

  Future<bool> checkCredentials(String email, String password) async {
    final studentDetails = await getStudentDetails();
    // Check if there is a matching entry in the database
    for (var detail in studentDetails) {
      if (detail.email == email && detail.password == password) {
        return true; // Credentials are valid
      }
    }
    return false; // Credentials are invalid
  }
}
