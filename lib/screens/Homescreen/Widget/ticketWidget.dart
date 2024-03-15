import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/TicketScreen/ticketScreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ticketWidget extends StatelessWidget {
  const ticketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 0.6,
          blurRadius: 20,
          offset: Offset(
            14,
            7,
          ),
        )
      ]),
      child: TicketWidget(
        color: Color.fromRGBO(114, 192, 202, 1),
        width: 350,
        height: 227,
        padding: EdgeInsets.all(7),
        isCornerRounded: true,
        child: Ticketscreen(),
      ),
    ));
  }
}
