import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/Widget/dayProgressbarWidget.dart';
import 'package:green/screens/Homescreen/Widget/ticketWidget.dart';
import 'package:green/screens/Homescreen/Widget/travelUp_Down_StatusWidget.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

class remaningScreenInTicket extends StatelessWidget {
  const remaningScreenInTicket({Key? key});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('studentDetails');
    StudentUtils index = StudentUtils();
    return StreamBuilder(
      stream: studentCollection.snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final DocumentSnapshot student =
              snapshot.data.docs[index.studentIndex];
          return GestureDetector(
            onTap: () {
              if (ModalRoute.of(context)?.isCurrent == true) {
                Navigator.pop(context);
              }
            },
            child: Column(
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
                        child: const CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 700),
                  child: const ticketWidget(),
                ),
                const SizedBox(
                  height: 30,
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
                      child: travelUpDownStatusWidget(),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Center(child: Text("No data"));
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
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'Aug': 8,
    'Sept': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12
  };

  int? monthValue = monthsMap[month];

  DateTime parsedDate = DateTime(year, monthValue!, day);

  return parsedDate;
}

String capitalizeEveryWord(String text) {
  if (text == null || text.isEmpty) {
    return text;
  }

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
