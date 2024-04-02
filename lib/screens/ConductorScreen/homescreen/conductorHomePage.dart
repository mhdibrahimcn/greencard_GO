import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';

import 'package:green/screens/ConductorScreen/homescreen/StudentDetailsScreen.dart';
import 'package:green/screens/ConductorScreen/homescreen/bottomnavigationConductor/bottomNavConductor.dart';
import 'package:green/screens/ConductorScreen/homescreen/qrScannerScreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

final _formkey = GlobalKey<FormState>();

class conductorHomePage extends StatelessWidget {
  conductorHomePage({super.key});
  final studentIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInLeft(
                  duration: const Duration(milliseconds: 700),
                  child: Text(
                    "Hello User!!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 700),
                  child: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      "Travel Route",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Aluva",
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
                          Icons.arrow_circle_right_outlined,
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
                          Icons.arrow_circle_right_outlined,
                          size: 20,
                          color: Colors.white60,
                        ),
                      ),
                      Text(
                        "Kalamassery",
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            height: 100,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.6,
                  blurRadius: 20,
                  offset: const Offset(
                    14,
                    7,
                  ),
                ),
              ],
              color: Mycolors.materialColor,
            ),
            child: Form(
              key: _formkey,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: studentIdController,
                        inputFormatters: [LengthLimitingTextInputFormatter(8)],
                        decoration: InputDecoration(
                            hintText: "Enter Student ID",
                            filled: true,
                            fillColor: Color.fromARGB(255, 112, 185, 195),
                            hintStyle: const TextStyle(color: Colors.white),
                            label: const Text(
                              "Student ID",
                            ),
                            prefixIcon:
                                const Icon(Icons.location_history_sharp),
                            suffixIcon: TextButton(
                              onPressed: () {
                                studentIdSubmit(context);
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          bottomNavConductor.selectedIndex.value = 1;
                        },
                        child: Icon(Icons.qr_code_scanner),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the value to get a squircle shape
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  studentIdSubmit(context) async {
    final studentId = studentIdController.text;
    final studentCollection =
        FirebaseFirestore.instance.collection('studentDetails');
    final querySnapshot = await studentCollection.get();

    if (_formkey.currentState!.validate()) {
      if (querySnapshot.docs.isNotEmpty) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var studentData = querySnapshot.docs[i].data();
          if (studentData['Student Id'] == studentId) {
            var student = Student(
                name: studentData['Name'],
                studentid: studentData['Student Id'],
                institution: studentData['Institution'],
                startingDestination: studentData['Starting_Destination'],
                endingDestination: studentData["Ending_Destination"],
                ticketStartingDate: studentData["TicketStartingDate"],
                ticketEndingDate: studentData["TicketEndingDate"],
                profileDpURL: studentData["ProfilePictureUrl"]);
            bottomNavConductor.selectedIndex.value = 0;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Student ${student.name} details are being loaded'),
              ),
            );

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        StudentDetailsScreen(student: student)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('No student found '),
              ),
            );
          }
        }
      }
    }
  }
}
