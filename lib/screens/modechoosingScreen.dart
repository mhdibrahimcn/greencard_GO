import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:lottie/lottie.dart';

class modeChoosingScreen extends StatelessWidget {
  const modeChoosingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed('conductorLoginScreen'),
            child: Container(
              color: Colors.greenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Conductor Mode",
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Lottie.asset(
                      "assets/condutor-mode.json",
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('stdRegistration'),
          child: Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Student Mode",
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Lottie.asset(
                      "assets/Student-mode.json",
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
