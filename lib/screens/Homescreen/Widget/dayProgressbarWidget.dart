import 'package:flutter/material.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'dart:async';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DayProgressbarWidget extends StatefulWidget {
  DayProgressbarWidget() : super();

  @override
  _DayProgressbarWidgetState createState() => _DayProgressbarWidgetState();
}

class _DayProgressbarWidgetState extends State<DayProgressbarWidget> {
  double progressValue = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _fetchProgressValueFromDatabase();
    print(progressValue);
    // Start a timer to update the progress value every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Calculate the progress based on the elapsed time since the start of the day
        progressValue = _calculateProgress();
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel(); // Cancel the timer when the widget is disposed
    }
    super.dispose();
  }

  void _fetchProgressValueFromDatabase() async {
    try {
      List<StudentsDetailModel> students =
          await studentDb.instance.getStudentDetails();
      // Assuming you have only one student and progressValue is stored in the first student's detail
      if (students.isNotEmpty) {
        setState(() {
          if (students[0].period == '1 Month') {
            progressValue = 30;
          } else {
            progressValue = 60;
          }
        });
      }
    } catch (e) {
      print("Error fetching progress value: $e");
    }
  }

  // Function to calculate the progress based on the elapsed time since the start of the day
  double _calculateProgress() {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
    Duration elapsed = now.difference(startOfDay);
    Duration totalDuration = endOfDay.difference(startOfDay);
    return 90 - (90 * elapsed.inSeconds / totalDuration.inSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(114, 192, 202, 1),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.6,
                blurRadius: 20,
                offset: const Offset(
                  14,
                  7,
                ),
              )
            ],
          ),
          width: 160,
          height: 170,
          child: SimpleCircularProgressBar(
            size: 120,
            progressStrokeWidth: 17,
            backStrokeWidth: 18,
            fullProgressColor: Colors.green,
            mergeMode: true,
            valueNotifier: ValueNotifier(progressValue),
            maxValue: 90,
            animationDuration: 6,
            progressColors: const [
              Colors.redAccent,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            backColor: const Color.fromARGB(255, 135, 147, 151),
            onGetText: (double value) {
              return Text(
                '${value.toInt()}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
