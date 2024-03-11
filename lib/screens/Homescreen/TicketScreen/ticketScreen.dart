import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Ticketscreen extends StatelessWidget {
  const Ticketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aluva',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ...List.generate(
                      2,
                      (index) => Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            size: 20,
                          )),
                  Text(
                    "To",
                    style: TextStyle(fontSize: 23),
                  ),
                  ...List.generate(
                      2,
                      (index) => Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            size: 20,
                          )),
                ],
              ),
            ),
            Text(
              'Kalamssery',
              style: TextStyle(
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
