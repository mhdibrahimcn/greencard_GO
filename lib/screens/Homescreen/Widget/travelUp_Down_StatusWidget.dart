import 'dart:async';
import 'package:flutter/material.dart';
import 'package:green/db/stdTravelHistoryDB.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentTravelHistory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'liquidcrystal/liquidcrysral.dart';

class travelUpDownStatusWidget extends StatefulWidget {
  const travelUpDownStatusWidget({Key? key}) : super(key: key);

  @override
  _travelUpDownStatusWidgetState createState() =>
      _travelUpDownStatusWidgetState();
}

class _travelUpDownStatusWidgetState extends State<travelUpDownStatusWidget> {
  String _travelStatus = ''; // Variable to store travel status
  double _upValue = 0.1; // Default value for 'Up' status
  double _downValue = 0.1; // Default value for 'Down' status
  late Timer _timer;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _fetchTravelStatus(); // Fetch travel status when widget initializes
    _currentDate = DateTime.now();
    _startDailyTimer();
  }

  void _startDailyTimer() {
    const oneDay = Duration(days: 1);
    final tomorrow =
        DateTime(_currentDate.year, _currentDate.month, _currentDate.day + 1);
    final timeUntilTomorrow = tomorrow.difference(DateTime.now());

    _timer = Timer.periodic(oneDay, (Timer timer) {
      setState(() {
        _currentDate = DateTime.now();
      });
      _resetValues();
    });

    // Reset values at the start of the app if the day has already passed
    if (timeUntilTomorrow.isNegative) {
      _resetValues();
    }
  }

  void _resetValues() {
    setState(() {
      _upValue = 0.1; // Default value for 'Up' status
      _downValue = 0.1; // Default value for 'Down' status
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _fetchTravelStatus() async {
    // Fetch student details from database
    final List<StudentTravelHistory_model> students =
        await StdTravelHistoryDb.instance.getStdTravelDetails();

    // Assuming there's only one student in the database for simplicity
    if (students.isNotEmpty) {
      final student = students.last;
      // Assuming travel status is stored in the student details model
      setState(() {
        _travelStatus = student.travelStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_travelStatus == 'Up') {
      print(_travelStatus);
      _upValue = 0.8; // Max value for 'Up' status
      // Min value for 'Down' status
    } else if (_travelStatus == 'Down') {
      print(_travelStatus);
      // Min value for 'Up' status
      _downValue = 0.8; // Max value for 'Down' status
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.2,
                blurRadius: 50,
                offset: const Offset(
                  -13,
                  0,
                ),
              )
            ]),
            width: 155,
            height: 80,
            child: LiquidLinearProgressIndicator(
              value: _downValue,
              valueColor: const AlwaysStoppedAnimation(
                Color.fromRGBO(114, 192, 202, 1),
              ),
              backgroundColor: Colors.white,
              borderColor: const Color.fromRGBO(114, 192, 202, 1),
              borderWidth: 3,
              borderRadius: 30.0,
              direction: Axis.vertical,
              center: const Text('Down'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.6,
                blurRadius: 20,
                offset: const Offset(
                  14,
                  7,
                ),
              )
            ]),
            width: 155,
            height: 80,
            child: LiquidLinearProgressIndicator(
              value: _upValue,
              valueColor: const AlwaysStoppedAnimation(
                Color.fromRGBO(114, 192, 202, 1),
              ),
              backgroundColor: Colors.white,
              borderColor: const Color.fromRGBO(114, 192, 202, 1),
              borderWidth: 3.0,
              borderRadius: 30.0,
              direction: Axis.vertical,
              center: const Text('UP'),
            ),
          )
        ],
      ),
    );
  }
}
