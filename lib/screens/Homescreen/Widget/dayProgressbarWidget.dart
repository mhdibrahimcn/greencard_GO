import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DayProgressbarWidget extends StatefulWidget {
  final DateTime initialDate;
  final double maxValue;

  const DayProgressbarWidget({
    required this.initialDate,
    required this.maxValue,
  });

  @override
  _DayProgressbarWidgetState createState() => _DayProgressbarWidgetState();
}

class _DayProgressbarWidgetState extends State<DayProgressbarWidget> {
  late Timer _timer;
  late double _progressValue;
  late double _maxValue;
  @override
  void initState() {
    super.initState();
    _maxValue = widget.maxValue;
    _progressValue = _maxValue; // Initialize progress value to maximum
    _timer = Timer.periodic(Duration(days: 1), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _maxValue -= 1;
    });
  }

  void _updateProgressValue() {
    setState(() {
      _progressValue -= 1;
      if (_progressValue < 0) {
        _progressValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateProgressValue(); // Update progress value when building widget
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
          child: ValueListenableBuilder<double>(
            valueListenable: ValueNotifier(_progressValue),
            builder: (context, value, child) {
              return SimpleCircularProgressBar(
                size: 120,
                progressStrokeWidth: 17,
                backStrokeWidth: 18,
                fullProgressColor: Colors.green,
                mergeMode: true,
                valueNotifier: ValueNotifier(value),
                maxValue: _maxValue,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
