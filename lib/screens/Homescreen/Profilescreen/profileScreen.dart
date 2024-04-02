import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/screens/Homescreen/Profilescreen/persondetails.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

final _formkey = GlobalKey<FormState>();

class profileScreen extends StatelessWidget {
  const profileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('studentDetails');
    StudentUtils index = StudentUtils();
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: studentCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                final DocumentSnapshot student =
                    snapshot.data!.docs[index.studentIndex];

                double progressValue = _calculateProgressValue(
                    parseDateString(student['TicketStartingDate']),
                    student['Period'] == '1 Month' ? 30 : 90);

                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                        Color.fromRGBO(114, 192, 202, 1),
                        Color.fromRGBO(98, 208, 223, 1)
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: FadeInLeft(
                                duration: const Duration(milliseconds: 700),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Profile",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => {_showLogoutDialog(context)},
                                      child: Icon(
                                        Icons.power_settings_new_outlined,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            FadeInDown(
                              duration: const Duration(milliseconds: 700),
                              child: Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: NetworkImage(
                                      student["ProfilePictureUrl"]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeInDown(
                              duration: const Duration(milliseconds: 700),
                              child: Column(
                                children: [
                                  Text(
                                    student['Name'],
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    student['Email'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    student['Institution'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 700),
                        child: Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(245, 249, 247, 247),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 325,
                                    child: AnimatedProgressBar(
                                      value: progressValue,
                                      duration: const Duration(seconds: 3),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.amber,
                                          Colors.red,
                                        ],
                                      ),
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.4),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${(progressValue.toDouble() * (student['Period'] == '1 Month' ? 30 : 90)).round()} Days left",
                                    ),
                                  ),
                                  PersonDetailScreen(student)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                );
              }
            }));
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Do you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "modeChoosingScreen", (route) => false);
            },
            child: Text("Yes"),
          ),
        ],
      );
    },
  );
}

double _calculateProgressValue(DateTime initialDate, double maxValue) {
  final currentDate = DateTime.now();
  final difference = currentDate.difference(initialDate).inDays;
  double progress = maxValue - difference;
  if (progress < 0) {
    progress = 0;
  }

  return progress / maxValue; // Return progress value between 0 and 1
}

DateTime parseDateString(String dateString) {
  // Split the string by space
  List<String> dateParts = dateString.split(' ');

  // Extract day, month, and year
  int day = int.parse(dateParts[0].replaceAll(RegExp(r'[^0-9]'), ''));
  String month = dateParts[1];
  int year = int.parse(dateParts[2]);

  // Map month names to their respective numerical value
  Map<String, int> monthsMap = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12
  };

  // Get the numerical value of the month
  int? monthValue = monthsMap[month];

  // Construct the DateTime object
  DateTime parsedDate = DateTime(year, monthValue!, day);

  return parsedDate;
}
