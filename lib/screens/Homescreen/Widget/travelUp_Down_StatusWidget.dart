import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'liquidcrystal/liquidcrysral.dart';

class travelUpDownStatusWidget extends StatelessWidget {
  const travelUpDownStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 160,
        height: 170,
        child: LiquidLinearProgressIndicator(
          value: 0.5, // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(
              Colors.blue), // Defaults to the current Theme's accentColor.
          backgroundColor:
              Colors.white, // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.blue[200],
          borderWidth: 6.0,
          borderRadius: 40.0,
          direction: Axis
              .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
          center: Column(
            children: [
              Text('UP'),
              Text("Loading..."),
            ],
          ),
        ),
      ),
    );
  }
}
