import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/Widget/dayProgressbarWidget.dart';
import 'package:green/screens/Homescreen/Widget/ticketWidget.dart';
import 'package:green/screens/Homescreen/Widget/travelUp_Down_StatusWidget.dart';

class remaningScreenInTicket extends StatelessWidget {
  const remaningScreenInTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.isCurrent == true) {
          Navigator.pop(context);
        }
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeInLeft(
                duration: const Duration(milliseconds: 700),
                child: const Text(
                  'Hi User!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 700),
                child: const CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        FadeInLeft(
            duration: const Duration(milliseconds: 700),
            child: const ticketWidget()),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: dayProgressbarWidget()),
            FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: const travelUpDownStatusWidget()),
          ],
        ),
      ]),
    );
  }
}
