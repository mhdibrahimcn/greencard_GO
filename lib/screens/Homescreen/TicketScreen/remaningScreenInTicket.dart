import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/Widget/dayProgressbarWidget.dart';
import 'package:green/screens/Homescreen/Widget/ticketWidget.dart';
import 'package:green/screens/Homescreen/Widget/travelUp_Down_StatusWidget.dart';

class remaningScreenInTicket extends StatelessWidget {
  const remaningScreenInTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 700),
              child: Text(
                'Hi User!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            FadeInRight(
              duration: Duration(milliseconds: 700),
              child: CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      FadeInLeft(duration: Duration(milliseconds: 700), child: ticketWidget()),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          FadeInUp(
              duration: Duration(milliseconds: 700),
              child: dayProgressbarWidget()),
          FadeInUp(
              duration: Duration(milliseconds: 700),
              child: travelUpDownStatusWidget()),
        ],
      ),
    ]);
  }
}
