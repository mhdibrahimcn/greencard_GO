import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';
import 'package:lottie/lottie.dart';

class phoneEmailVerifyScreen extends StatelessWidget {
  phoneEmailVerifyScreen({super.key});
  final gaurdinNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar.appBar("Contact Verification"),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LottieBuilder.asset(
                "assets/email.json",
                width: 300,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: gaurdinNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Name of the Gaurdian",
                    hintStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Gaurdian Name",
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
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "abdcd@gmail.com",
                    hintStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Email",
                    ),
                    prefixIcon: const Icon(EvaIcons.email),
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
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter The Phone Number",
                    hintStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Ph",
                    ),
                    prefixIcon: const Icon(Icons.phone),
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
              padding: const EdgeInsets.only(top: 15.0, right: 8),
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
                        onPressed: () {
                          addContactDetails();
                          Navigator.of(context)
                              .pushNamed('DestinationinfoScreen');
                        },
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

  Future<void> addContactDetails() async {
    final gaurdianName = gaurdinNameController.text;
    final email = emailController.text;
    final phoneNostr = phoneNumberController.text;
    if (gaurdianName == null) {
      return;
    }
    if (phoneNostr == null) {
      return;
    }
    if (email == null) {
      return;
    }
    final phoneNo = int.tryParse(phoneNostr);

    StudentDetail studentDetail = new StudentDetail();
    studentDetail.gurdianName = gaurdianName;
    studentDetail.email = email;
    studentDetail.phoneNumber = phoneNo!;
  }
}
