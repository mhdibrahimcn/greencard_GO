import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:green/screens/ConductorScreen/homescreen/qrScannerScreen.dart';
// Import your database functions

class stdLoginScreen extends StatefulWidget {
  const stdLoginScreen({super.key});

  @override
  State<stdLoginScreen> createState() => _stdLoginScreenState();
}

class _stdLoginScreenState extends State<stdLoginScreen> {
  bool _passwordVisible = false;
  bool _obscuretext = true;
  double _blurvalue = 0;
  final usernammeController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: ClipRRect(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _blurvalue,
                  sigmaY: _blurvalue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Let's go \n",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 50,
                              color: Color.fromARGB(255, 139, 179, 228),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _blurvalue = 10;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            _blurvalue = 0;
                          });
                        },
                        controller: usernammeController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black45,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email or Phone No',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[100]),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _blurvalue = 10;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            _blurvalue = 0;
                          });
                        },
                        controller: passwordController,
                        obscureText: _obscuretext,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black45,
                            ),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                                _obscuretext = !_obscuretext;
                              });
                            },
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //text(Dont have an account)
                      Row(
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () => print('f'),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 104, 196),
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                      //Login button
                      ElevatedButton(
                        onPressed: () => _login(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                            340.0,
                            60.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 139, 179, 228),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final email = usernammeController.text.trim();
      final password = passwordController.text.trim();

      try {
        final studentCollection =
            FirebaseFirestore.instance.collection('studentDetails');
        final querySnapshot = await studentCollection.get();

        if (querySnapshot.docs.isNotEmpty) {
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            var studentData = querySnapshot.docs[i].data();
            if (studentData['Email'] == email &&
                studentData['Password'] == password) {
              print(studentData['Email']);
              print("helooooooooooofdvgof$i");
              StudentUtils.instance.studentIndex = i;
              Navigator.of(context).pushReplacementNamed('stdHomeScreen');
            }
          }
        } else {
          // Show error message if login fails
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Login Failed'),
              content: Text('Invalid email or password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        print('Error: $e');
        // Show error message if an exception occurs
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}

class StudentUtils {
  late int studentIndex;

  StudentUtils._internal();
  static StudentUtils instance = StudentUtils._internal();
  factory StudentUtils() {
    return instance;
  }
  void updateFormValues(StudentUtils detail) {
    studentIndex = detail.studentIndex;
  }
}
