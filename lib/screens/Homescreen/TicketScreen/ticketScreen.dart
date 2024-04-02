import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticketscreen extends StatelessWidget {
  final bool showqr;
  const Ticketscreen({Key? key, required bool this.showqr});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('studentDetails');
    StudentUtils index = StudentUtils();
    return StreamBuilder(
      stream: studentCollection.snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final DocumentSnapshot student =
              snapshot.data.docs[index.studentIndex];
          return SizedBox(
            width: 330,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            student["Starting_Destination"],
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              'In',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17, top: 10),
                        child: Column(
                          children: [
                            ...List.generate(
                              2,
                              (index) => const Icon(
                                Icons.arrow_drop_down_circle_sharp,
                                size: 20,
                                color: Colors.white60,
                              ),
                            ),
                            Text(
                              "To",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...List.generate(
                              2,
                              (index) => const Icon(
                                Icons.arrow_drop_down_circle_sharp,
                                size: 20,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            student["Ending_Destination"],
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              'Out',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 12,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        student["TicketStartingDate"],
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...List.generate(
                        1,
                        (index) => const Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 20,
                          color: Colors.white60,
                        ),
                      ),
                      Text(
                        student["TicketEndingDate"],
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      showqr == true
                          ? TextButton(
                              onPressed: () =>
                                  floatingActionInNav.bottomSheet(context),
                              child: QrImageView(
                                data: student["Student Id"],
                                version: QrVersions.auto,
                                size: 70.0,
                                eyeStyle: const QrEyeStyle(
                                  color: Colors.black,
                                  eyeShape: QrEyeShape.square,
                                ),
                              ),
                            )
                          : Text(""),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Center(child: Text("No data"));
      },
    );
  }
}
