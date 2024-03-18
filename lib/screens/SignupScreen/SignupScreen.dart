import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/widget/datepicker.dart';
import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';
import 'package:lottie/lottie.dart';

class signupScreen extends StatelessWidget {
  const signupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig().SystemNavconfig(Mycolors.materialColor);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar.appBar("Create Account"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: LottieBuilder.asset(
                "assets/student.json",
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Full Name.....",
                    hintStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Full Name",
                    ),
                    prefixIcon: const Icon(EvaIcons.person),
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
                    hintText: "Enter Institution.....",
                    hintStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Institution",
                    ),
                    prefixIcon: const Icon(Icons.school),
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
            MyDatePicker(),
            Padding(
              padding: const EdgeInsets.only(top: 17.0, right: 8),
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
                            .pushNamed('PhoneEmailVerifyScreen'),
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
