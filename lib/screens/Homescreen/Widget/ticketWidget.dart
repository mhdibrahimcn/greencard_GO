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
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 6,
          offset: Offset(0, 5),
        )
      ]),
      child: TicketWidget(
        color: Color.fromRGBO(52, 100, 230, 1),
        width: 350,
        height: 227,
        padding: EdgeInsets.all(7),
        isCornerRounded: true,
        child: Ticketscreen(),
      ),
    ));
  }
}
