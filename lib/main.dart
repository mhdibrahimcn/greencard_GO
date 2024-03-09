import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green/screens/Homescreen/stdHomescreenLogin.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:green/screens/Login/stdRegistrationScreen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(248, 116, 188, 236),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.blue,
    // ));
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 145, 199, 148)),
      debugShowCheckedModeBanner: false,
      home: stdRegistrationScreen(),
      routes: {
        'stdRegistration': (context) => stdRegistrationScreen(),
        'stdLoginscreen': (context) => stdLoginScreen(),
        'stdHomeScreen': (context) => stdHomescreen(),
      },
    );
  }
}
