import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/stdHomescreenLogin.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:green/screens/modechoosingScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void checkLoggedInStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final index = prefs.getInt('studentIndex');

    print(isLoggedIn);
    print(index);

    if (isLoggedIn && index != null) {
      StudentUtils.instance.studentIndex = index;
      navigateToHomeScreen(context);
    } else {
      navigateToModechoosing(context);
    }
  }

  void navigateToModechoosing(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const modeChoosingScreen()),
      );
    });
  }

  void navigateToHomeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const stdHomescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLoggedInStatus(context); // Check login status when the screen is built

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
