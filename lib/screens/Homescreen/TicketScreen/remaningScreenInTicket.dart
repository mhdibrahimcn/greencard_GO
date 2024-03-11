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
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi User!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            )
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      ticketWidget(),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          dayProgressbarWidget(),
          travelUpDownStatusWidget(),
        ],
      ),
      ElevatedButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.greenAccent,
                    height: 500,
                    width: 380,
                    child: Text('hello'),
                  ),
                );
              },
            );
          },
          child: Text('clickme'))
    ]);
  }
}
