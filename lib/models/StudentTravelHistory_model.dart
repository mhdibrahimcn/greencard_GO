import 'package:hive_flutter/hive_flutter.dart';
part 'StudentTravelHistory_model.g.dart';

@HiveType(typeId: 2)
class StudentTravelHistory_model {
  @HiveField(0)
  final String travelId;
  @HiveField(1)
  final String travelStatus;

  @HiveField(2)
  final DateTime travelDate;

  StudentTravelHistory_model(
      {required this.travelId,
      required this.travelStatus,
      required this.travelDate});
}
