import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:lottie/lottie.dart';

class idVerificationScreen extends StatelessWidget {
  const idVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar.appBar("Documents"),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset(
                "assets/Card.json",
                width: 300,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(12)],
                decoration: InputDecoration(
                    hintText: "xxxx  xxxx   xxxx",
                    hintStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Aadhar No",
                    ),
                    prefixIcon: const Icon(EvaIcons.creditCard),
                    filled: true,
                    fillColor: Mycolors.material_dark,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Mycolors.materialColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14))),
                    child: IconButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed('AddressVerficationScreen'),
                        icon: const Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.white,
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
