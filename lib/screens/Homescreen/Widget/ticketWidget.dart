import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/TicketScreen/ticketScreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ticketWidget extends StatelessWidget {
  const ticketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TicketWidget(
          color: Colors.blue,
          width: 330,
          height: 400,
          isCornerRounded: true,
          padding: EdgeInsets.all(20),
          child: Ticketscreen(),
        ),
      ),
    );
  }
}
