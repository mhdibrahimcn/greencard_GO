import 'package:flutter/material.dart';
import 'package:green/models/StudentTravelHistory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const STUDENT_TRAVEL_HISTORY_DB_NAME = "stdTravelHistory-database";

abstract class StdTravelHistoryDbFunctions {
  Future<void> insertStdTravelDetails(StudentTravelHistory_model value);
  Future<List<StudentTravelHistory_model>> getStdTravelDetails();
}

class StdTravelHistoryDb extends StdTravelHistoryDbFunctions {
  StdTravelHistoryDb._internal();
  static StdTravelHistoryDb instance = StdTravelHistoryDb._internal();
  factory StdTravelHistoryDb() {
    return instance;
  }

  ValueNotifier<List<StudentTravelHistory_model>> stdTravelModelNotifier =
      ValueNotifier([]);

  // Open the box only if it's not already open
  Future<Box<StudentTravelHistory_model>> _openBox() async {
    if (!Hive.isBoxOpen(STUDENT_TRAVEL_HISTORY_DB_NAME)) {
      return await Hive.openBox<StudentTravelHistory_model>(
          STUDENT_TRAVEL_HISTORY_DB_NAME);
    } else {
      return Hive.box<StudentTravelHistory_model>(
          STUDENT_TRAVEL_HISTORY_DB_NAME);
    }
  }

  @override
  Future<void> insertStdTravelDetails(StudentTravelHistory_model value) async {
    final studentTravelDb = await _openBox();
    studentTravelDb.put(value.travelId, value);
    await studentTravelDb.close(); // Close the box after use
  }

  @override
  Future<List<StudentTravelHistory_model>> getStdTravelDetails() async {
    final studentTravelDb = await _openBox();
    final List<StudentTravelHistory_model> list =
        studentTravelDb.values.toList();
    await studentTravelDb.close(); // Close the box after use
    return list;
  }

  Future<void> refreshUi() async {
    final _list = await getStdTravelDetails();
    _list.sort(
        (first, second) => second.travelDate.compareTo(second.travelDate));
    stdTravelModelNotifier.value = _list; // Update value directly
    stdTravelModelNotifier.notifyListeners();
  }

  Future<void> closeStdDb() async {
    await Hive.close(); // Close all boxes
  }
}
