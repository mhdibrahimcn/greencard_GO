import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrBottomSheetScreen extends StatelessWidget {
  const qrBottomSheetScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    StudentUtils index = StudentUtils();
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('studentDetails').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final student = snapshot.data!.docs[index.studentIndex].data()
              as Map<String, dynamic>;
          return SizedBox(
            height: 400,
            width: 400,
            child: Column(
              children: [
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(child: Icon(Icons.person)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        student['Name'],
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: QrImageView(
                      data: student['Student Id'],
                      version: QrVersions.auto,
                      size: 230.0,
                      foregroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        color: Colors.black,
                        eyeShape: QrEyeShape.square,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Scan to pay Bus ticket',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        student['Starting_Destination'],
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ...List.generate(
                        3,
                        (index) => const Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 19,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        student['Ending_Destination'],
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Ticket Id: ${student['Student Id']}',
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
          );
        }
      },
    );
  }
}
