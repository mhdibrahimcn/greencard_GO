import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/db/stdTravelHistoryDB.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentTravelHistory_model.dart';
import 'package:intl/intl.dart';

class StudentSubmitScreen extends StatefulWidget {
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
            onPressed: () {},
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
    String travelId = generateCustomID();
    final currentDate = DateTime.now();
    final travelStatus = selectedButton;

    final studentHistoryModel = StudentTravelHistory_model(
        travelId: travelId,
        travelStatus: travelStatus,
        travelDate: currentDate);
    stdTravelHistoryDb.instance.insertStdTravelDetails(studentHistoryModel);
  }
}

String generateCustomID() {
  // Get current date and time
  DateTime now = DateTime.now();

  // Format date and time
  String formattedDate = DateFormat('yyyyMMddHHmmss').format(now);

  // Extract last 6 digits from formatted date and time
  String lastSixDigits = formattedDate.substring(formattedDate.length - 6);

  // Convert last 6 digits to integer
  int id = int.parse(lastSixDigits);

  return id.toString(); // Return as string
}
