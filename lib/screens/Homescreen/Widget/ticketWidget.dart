import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/TicketScreen/ticketScreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ticketWidget extends StatelessWidget {
  final checkinPayment;

  ticketWidget({super.key, required this.checkinPayment});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 0.6,
          blurRadius: 20,
          offset: const Offset(
            14,
            7,
          ),
        )
      ]),
      child: TicketWidget(
        color: Color.fromRGBO(114, 192, 202, 1),
        width: screenwidth * 0.95,
        height: screenheight * 0.29,
        padding: EdgeInsets.all(7),
        isCornerRounded: true,
        child: Ticketscreen(showqr: checkinPayment),
      ),
    ));
  }
}
