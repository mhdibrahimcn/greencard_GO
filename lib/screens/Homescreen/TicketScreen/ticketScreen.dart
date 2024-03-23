import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticketscreen extends StatelessWidget {
  const Ticketscreen({Key? key});

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
            width: 330,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            student.startingDestination,
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
                            student.endingDestination,
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
                        student.ticketStartingDate,
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
                        student.ticketEndingDate,
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
                      TextButton(
                        onPressed: () =>
                            floatingActionInNav.bottomSheet(context),
                        child: QrImageView(
                          data: student.studentid,
                          version: QrVersions.auto,
                          size: 70.0,
                          eyeStyle: const QrEyeStyle(
                            color: Colors.black,
                            eyeShape: QrEyeShape.square,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
