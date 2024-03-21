import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/SignupScreen.dart';
import 'package:lottie/lottie.dart';

class passwordCreationScreen extends StatelessWidget {
  const passwordCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                obscureText: true,
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
                        onPressed: () =>
                            Navigator.of(context).pushNamed('stdHomeScreen'),
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
    );
  }
}
