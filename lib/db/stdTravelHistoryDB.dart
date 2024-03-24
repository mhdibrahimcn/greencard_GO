import 'package:green/models/StudentTravelHistory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const STUDENT_TRAVEL_HISTORY_DB_NAME = "stdTravelHistory-database";

abstract class stdTravelHistoryDbFunctions {
  Future<void> insertStdTravelDetails(StudentTravelHistory_model value);
  Future<List<StudentTravelHistory_model>> getStdTravelDetails();
}

class stdTravelHistoryDb extends stdTravelHistoryDbFunctions {
  stdTravelHistoryDb._internal();
  static stdTravelHistoryDb instance = stdTravelHistoryDb._internal();
  factory stdTravelHistoryDb() {
    return instance;
  }

  @override
  Future<void> insertStdTravelDetails(StudentTravelHistory_model value) async {
    final student_travel_db =
        await Hive.openBox(STUDENT_TRAVEL_HISTORY_DB_NAME);
    student_travel_db.put(value.travelId, value);
  }

  @override
  Future<List<StudentTravelHistory_model>> getStdTravelDetails() async {
    final student_travel_db = await Hive.openBox<StudentTravelHistory_model>(
        STUDENT_TRAVEL_HISTORY_DB_NAME);

    return student_travel_db.values.toList();
  }
}
