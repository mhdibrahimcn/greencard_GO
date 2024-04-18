import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';

import 'package:green/screens/ConductorScreen/homescreen/qrScannerScreen.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

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
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: SlideAction(
            borderRadius: 100,
            elevation: 1,
            outerColor: Mycolors.materialColor,
            innerColor: Colors.white,
            text: "Slide to Submit",
            textStyle: TextStyle(fontSize: 20),
            onSubmit: () async {
              submit();
            },
          ),
        ),
      ],
    );
  }

  void submit() async {
    final currentDate = DateTime.now();
    final travelStatus = selectedButton;
    String uid = widget.student.uid;
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('Student_Travel');
    if (selectedButton.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select Up or Down before submitting.'),
          duration: Duration(seconds: 2),
        ),
      );
      return; // Exit the method if no button is selected
    }

    await studentCollection.doc(uid).collection("Travel_History").add({
      'travel_date': Timestamp.fromDate(currentDate),
      'travel_status': travelStatus,
    }).then((_) async {
      await Future.delayed(Durations.long1);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully added!'),
          duration: Duration(seconds: 2),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }
}
