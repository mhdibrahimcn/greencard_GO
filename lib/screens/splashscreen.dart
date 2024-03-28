import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/modechoosingScreen.dart';
import 'package:lottie/lottie.dart'; // Import your modeChoosingScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here
    // For example, you can load data, initialize services, etc.
    // Once initialization is complete, navigate to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const modeChoosingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your splash screen UI
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/splash.json",
            width: 300,
            height: 300,
          ),
          Text(
            "GreenCard Go",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                color: Mycolors.materialColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
