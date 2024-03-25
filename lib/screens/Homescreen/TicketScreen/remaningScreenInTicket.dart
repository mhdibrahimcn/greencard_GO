import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:green/screens/Homescreen/Widget/dayProgressbarWidget.dart';
import 'package:green/screens/Homescreen/Widget/ticketWidget.dart';
import 'package:green/screens/Homescreen/Widget/travelUp_Down_StatusWidget.dart';

class remaningScreenInTicket extends StatelessWidget {
  const remaningScreenInTicket({super.key});

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
                              capitalizeEveryWord(student.name),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
                        child: const ticketWidget()),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        FadeInUp(
                            duration: const Duration(milliseconds: 700),
                            child: DayProgressbarWidget(
                              initialDate:
                                  parseDateString(student.ticketStartingDate),
                              maxValue: student.period == '1 Month' ? 30 : 90,
                            )),
                        FadeInUp(
                            duration: const Duration(milliseconds: 700),
                            child: travelUpDownStatusWidget()),
                      ],
                    ),
                  ]),
            );
          }
        });
  }
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

  // Get the numerical value of the month
  int? monthValue = monthsMap[month];

  // Construct the DateTime object
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
