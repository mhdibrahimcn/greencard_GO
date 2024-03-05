import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/homescreenLogin.dart';
import 'package:green/screens/Login/stdlog.dart';
import 'package:green/screens/Login/stdmainscreen.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 145, 199, 148)),
      home: stdmainscreen(),
      routes: {
        'stdlog': (context) => stdlog(),
        'homescreenLogin': (context) => homescreenLogin(),
      },
    );
  }
}

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('helooo')),
    );
  }
}
