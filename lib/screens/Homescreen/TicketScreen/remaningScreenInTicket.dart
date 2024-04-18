import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animate_do/animate_do.dart';

import 'package:green/screens/Homescreen/Widget/dayProgressbarWidget.dart';
import 'package:green/screens/Homescreen/Widget/ticketWidget.dart';
import 'package:green/screens/Homescreen/Widget/travelUp_Down_StatusWidget.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';

class remaningScreenInTicket extends StatelessWidget {
  const remaningScreenInTicket({Key? key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('studentDetails');
    double screenwidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: user != null ? studentCollection.doc(user.uid).get() : null,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the snapshot
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final DocumentSnapshot student = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
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
                        capitalizeEveryWord(student['Name']),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 700),
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(student['ProfilePictureUrl'])),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 700),
                child: ticketWidget(
                  checkinPayment: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 700),
                    child: DayProgressbarWidget(
                      initialDate:
                          parseDateString(student["TicketStartingDate"]),
                      maxValue: student["Period"] == '1 Month' ? 30 : 90,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 700),
                    child: travelUpDownStatusWidget(student["Student Id"]),
                  ),
                ],
              ),
            ],
          );
        } else {
          // If no data is available
          return Center(child: Text("No data"));
        }
      },
    );
  }
}

DateTime parseDateString(String dateString) {
  List<String> dateParts = dateString.split(' ');
  int day = int.parse(dateParts[0].replaceAll(RegExp(r'[^0-9]'), ''));
  String month = dateParts[1];
  int year = int.parse(dateParts[2]);

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

  int? monthValue = monthsMap[month];

  DateTime parsedDate = DateTime(year, monthValue!, day);

  return parsedDate;
}

String capitalizeEveryWord(String text) {
  List<String> words = text.split(' ');
  List<String> capitalizedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      capitalizedWords.add(capitalizedWord);
    }
  }

  return capitalizedWords.join(' ');
}
