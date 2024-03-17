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
                value: 0.1, // Defaults to 0.5.
                valueColor: const AlwaysStoppedAnimation(
                  Color.fromRGBO(114, 192, 202, 1),
                ), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: const Color.fromRGBO(114, 192, 202, 1),
                borderWidth: 3,
                borderRadius: 30.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: const Text('Down')),
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
                value: 0.9, // Defaults to 0.5.
                valueColor: const AlwaysStoppedAnimation(
                  Color.fromRGBO(114, 192, 202, 1),
                ), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: const Color.fromRGBO(114, 192, 202, 1),
                borderWidth: 3.0,
                borderRadius: 30.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: const Text('UP')),
          )
        ],
      ),
    );
  }
}
