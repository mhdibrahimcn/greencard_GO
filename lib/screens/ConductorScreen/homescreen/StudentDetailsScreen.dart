import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:green/screens/ConductorScreen/homescreen/qrScannerScreen.dart';
import 'package:green/screens/ConductorScreen/homescreen/studentsubmitscreen.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:ticket_widget/ticket_widget.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student;

  const StudentDetailsScreen({Key? key, required this.student})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(label: "Ticket ID: ${student.studentid}"),
        body: Column(children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
              ),
              Text(
                student.name,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Center(
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
                    width: 350,
                    height: 227,
                    padding: EdgeInsets.all(7),
                    isCornerRounded: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              student.startingDestination,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "And",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              student.endingDestination,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              student.ticketStartingDate,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "Between",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              student.ticketEndingDate,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Institution: ${student.institution}",
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
          SizedBox(
            height: 50,
          ),
          StudentSubmitScreen(student: student),
        ]));
  }
}
