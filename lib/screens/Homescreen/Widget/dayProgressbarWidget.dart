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
    _progressValue = _calculateProgressValue(); // Calculate initial progress
    _timer = Timer.periodic(Duration(days: 1), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _progressValue = _calculateProgressValue(); // Update progress value
    });
  }

  double _calculateProgressValue() {
    final currentDate = DateTime.now();
    final difference = currentDate.difference(widget.initialDate).inDays;
    double progress = widget.maxValue - difference;
    print(progress);
    if (progress < 0) {
      progress = 0;
    }
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
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
          width: screenwidth * 0.4,
          height: screenheight * 0.23,
          child: SimpleCircularProgressBar(
            size: 120,
            progressStrokeWidth: 17,
            backStrokeWidth: 18,
            fullProgressColor: Colors.white,
            mergeMode: true,
            valueNotifier: ValueNotifier(_progressValue),
            maxValue: widget.maxValue,
            animationDuration: 4,
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
