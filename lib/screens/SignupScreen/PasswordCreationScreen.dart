import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/db/studentDb.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/SignupScreen.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

final _formkey = GlobalKey<FormState>();
String _password = '';
String _confirmPassword = '';

class passwordCreationScreen extends StatelessWidget {
  passwordCreationScreen({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              appbar.appBar("Password"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: LottieBuilder.asset(
                  "assets/password.json",
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
                    }
                    _password = value;
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Password",
                      ),
                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon: const Icon(Icons.password),
                      filled: true,
                      fillColor: Mycolors.material_dark,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value != _password) {
                      print(value);
                      print(_password);
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword != value;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: "Confirm Password.....",
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Confirm Password",
                      ),
                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon: const Icon(Icons.password),
                      filled: true,
                      fillColor: Mycolors.material_dark,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Mycolors.materialColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14))),
                      child: TextButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Setpassword();
                              studentDb.instance.closeStdDb();
                              Navigator.of(context)
                                  .restorablePushReplacementNamed(
                                      'stdLoginscreen');
                            }
                          },
                          child: Text(
                            'Create Account',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Setpassword() async {
    final password = passwordController.text;
    DateTime date = DateTime.now();
    final ticketStartingDate = formatDate(date);
    DateTime true_date;
    StudentDetail studentDetail = new StudentDetail();
    if (studentDetail.period == "1 Month") {
      true_date = date.add(Duration(days: 30));
    } else {
      true_date = date.add(Duration(days: 90));
    }
    final ticketEndingDate = formatDate(true_date);
    studentDetail.password = password;
    studentDetail.ticketStartingDate = ticketStartingDate;
    studentDetail.ticketEndingDate = ticketEndingDate;

    final StudentDetailmodel = StudentsDetailModel(
        studentDetail.studentid,
        studentDetail.name,
        studentDetail.institution,
        studentDetail.dob,
        studentDetail.gurdianName,
        studentDetail.aadharNo,
        studentDetail.email,
        studentDetail.phoneNumber,
        studentDetail.password,
        studentDetail.startingDestination,
        studentDetail.endingDestination,
        studentDetail.period,
        studentDetail.deponame,
        studentDetail.distict,
        studentDetail.city,
        studentDetail.pincode,
        studentDetail.ticketStartingDate,
        studentDetail.ticketEndingDate);
    studentDb.instance.insertStudentDetails(StudentDetailmodel);
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String formatDate(DateTime date) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    String daySuffix = _getDaySuffix(date.day);
    return formattedDate.replaceFirstMapped(
      RegExp(r'(\d+)'),
      (match) => "${match.group(1)}$daySuffix",
    );
  }
}
