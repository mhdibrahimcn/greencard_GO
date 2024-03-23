import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrBottomSheetScreen extends StatelessWidget {
  const qrBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<StudentsDetailModel>> newlist() async {
      return await studentDb.instance.getStudentDetails();
    }

    return FutureBuilder<List<StudentsDetailModel>>(
        future: newlist(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Or any other loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final student =
                snapshot.data![0]; // Accessing the first item in the list
            return SizedBox(
              height: 400,
              width: 400,
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          student.name,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: QrImageView(
                        data: student.studentid,
                        version: QrVersions.auto,
                        size: 230.0,
                        // ignore: deprecated_member_use
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
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          student.startingDestination,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                        ...List.generate(
                            3,
                            (index) => const Icon(
                                  Icons.arrow_drop_down_circle_sharp,
                                  size: 19,
                                  color: Colors.white,
                                )),
                        Text(
                          student.endingDestination,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Ticket Id: ${student.studentid}',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            );
          }
        });
  }
}
