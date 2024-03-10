import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Ticketscreen extends StatelessWidget {
  const Ticketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kunnuvazhy',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Aluva',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
