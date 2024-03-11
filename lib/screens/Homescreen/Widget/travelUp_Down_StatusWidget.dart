import 'package:flutter/material.dart';

import 'liquidcrystal/liquidcrysral.dart';

class travelUpDownStatusWidget extends StatelessWidget {
  const travelUpDownStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          Container(
            width: 160,
            height: 80,
            child: LiquidLinearProgressIndicator(
                value: 0.1, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors
                    .blue), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.blue[200],
                borderWidth: 6,
                borderRadius: 30.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text('Down')),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 160,
            height: 80,
            child: LiquidLinearProgressIndicator(
                value: 0.9, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors
                    .blue), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.blue[200],
                borderWidth: 6.0,
                borderRadius: 30.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text('UP')),
          )
        ],
      ),
    );
  }
}
