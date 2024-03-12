import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/TicketScreen/ticketScreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ticketWidget extends StatelessWidget {
  const ticketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TicketWidget(
      color: Color.fromARGB(248, 116, 188, 236),
      width: 350,
      height: 227,
      padding: EdgeInsets.all(7),
      isCornerRounded: true,
      child: Ticketscreen(),
    ));
  }
}
