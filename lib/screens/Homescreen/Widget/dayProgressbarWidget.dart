import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class dayProgressbarWidget extends StatelessWidget {
  dayProgressbarWidget({super.key});
  ValueNotifier<double> progressNotifier = ValueNotifier(68);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 160,
          height: 170,
          color: Colors.blue[200],
          child: SimpleCircularProgressBar(
              size: 120,
              progressStrokeWidth: 17,
              backStrokeWidth: 18,
              fullProgressColor: Colors.green,
              mergeMode: true,
              valueNotifier: progressNotifier,
              maxValue: 90,
              animationDuration: 6,
              progressColors: const [
                Colors.redAccent,
                Colors.orangeAccent,
                Colors.amberAccent,
                Colors.green,
                Colors.cyan,
              ],
              backColor: Color.fromARGB(255, 135, 147, 151),
              onGetText: (double value) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
