import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StudentsDetailModel>>(
      future: studentDb().getStudentDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<StudentsDetailModel> studentDetails = snapshot.data!;
          if (studentDetails.isEmpty) {
            return Center(child: Text('No student details found'));
          } else {
            StudentsDetailModel student = studentDetails.first;
            double progressValue = _calculateProgressValue(
                parseDateString(student.ticketStartingDate),
                student.period == '1 Month' ? 30 : 90);

            return Column(
              children: [
                appbar.appBar('Profile'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 20),
                      child: CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          student.name,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          student.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Day Progress"),
                ),
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
                    backgroundColor: Colors.grey.withOpacity(0.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${progressValue.toInt() * (student.period == '1 Month' ? 30 : 90)} days left",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundedButton(
                      label: 'Personal Details',
                      onPressed: () {
                        // Handle personal details button press
                        print('Personal Details button pressed');
                      },
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      label: 'Address Details',
                      onPressed: () {
                        // Handle address details button press
                        print('Address Details button pressed');
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed("modeChoosingScreen"),
                    child: Text("Logout"),
                  ),
                ),
              ],
            );
          }
        }
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
}

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 105, 178, 187)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          elevation:
              MaterialStateProperty.all<double>(5), // Box shadow elevation
          shadowColor: MaterialStateProperty.all<Color>(
              Colors.black), // Box shadow color
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
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
