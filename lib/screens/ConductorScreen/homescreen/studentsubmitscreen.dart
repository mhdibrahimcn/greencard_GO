import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';

import 'package:green/screens/ConductorScreen/homescreen/qrScannerScreen.dart';
import 'package:intl/intl.dart';

class StudentSubmitScreen extends StatefulWidget {
  final Student student;
  const StudentSubmitScreen({Key? key, required this.student})
      : super(key: key);

  @override
  _StudentSubmitScreenState createState() => _StudentSubmitScreenState();
}

class _StudentSubmitScreenState extends State<StudentSubmitScreen> {
  String selectedButton = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedButton = 'Up';
                });
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedButton == 'Up'
                      ? Mycolors.materialColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Mycolors.materialColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Up',
                    style: TextStyle(
                      color:
                          selectedButton == 'Up' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedButton = 'Down';
                });
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedButton == 'Down'
                      ? Mycolors.materialColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Mycolors.materialColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Down',
                    style: TextStyle(
                      color: selectedButton == 'Down'
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 60,
          width: 180,
          child: TextButton(
            onPressed: () {
              submit();
              Navigator.of(context).pop();
            },
            child: Text(
              "Submit",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(114, 192, 202, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Adjust the radius to change the roundness of the button
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  submit() async {
    final currentDate = DateTime.now();
    final travelStatus = selectedButton;
    String studentId = widget.student.studentid;
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('Student_Travel');

    studentCollection.doc(studentId).collection("Travel_History").add({
      'travel_date': Timestamp.fromDate(currentDate),
      'travel_status': travelStatus,
    }); // Show toast notification for successful submission
  }
}
