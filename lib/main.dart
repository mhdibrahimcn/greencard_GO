import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green/screens/Homescreen/stdHomescreenLogin.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:green/screens/Login/stdRegistrationScreen.dart';
import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig().SystemNavconfig(Color.fromARGB(116, 190, 239, 255));
    return MaterialApp(
      theme: ThemeData(
        // ignore: deprecated_member_use
        primaryColor: Color.fromRGBO(114, 192, 202, 1),
      ),
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
