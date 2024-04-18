import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';

class Ticketscreen extends StatelessWidget {
  final bool showqr;
  const Ticketscreen({Key? key, required this.showqr});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('studentDetails');

    return StreamBuilder(
      stream: studentCollection.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          final DocumentSnapshot student = documents.firstWhere(
            (doc) => doc['userid'] == user!.uid,
            orElse: () =>
                throw Exception('No document found with matching userId'),
          );

          return SizedBox(
            width: 330,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "In",
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17, top: 10),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.arrow_drop_down_circle_sharp,
                              size: 20,
                              color: Colors.white60,
                            ),
                            Text(
                              "To",
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_circle_sharp,
                              size: 20,
                              color: Colors.white60,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            student["Ending_Destination"],
                            style: GoogleFonts.inter(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Out",
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
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
                      const SizedBox(height: 12),
                      Text(
                        student["TicketStartingDate"],
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_circle_sharp,
                        size: 20,
                        color: Colors.white60,
                      ),
                      Text(
                        student["TicketEndingDate"],
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 26),
                      if (showqr)
                        TextButton(
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
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text("No ticket data found"));
        }
      },
    );
  }
}
