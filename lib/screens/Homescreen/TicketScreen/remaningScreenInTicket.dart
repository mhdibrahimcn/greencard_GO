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
                      height: 40,
                    ),
                    FadeInLeft(
                        duration: const Duration(milliseconds: 700),
                        child: const ticketWidget()),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        FadeInUp(
                            duration: const Duration(milliseconds: 700),
                            child: DayProgressbarWidget()),
                        FadeInUp(
                            duration: const Duration(milliseconds: 700),
                            child: const travelUpDownStatusWidget()),
                      ],
                    ),
                  ]),
            );
          }
        });
  }
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
