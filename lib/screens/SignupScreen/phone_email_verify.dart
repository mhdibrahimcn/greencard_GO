import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/CapiialiseFirstLetter.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';
import 'package:lottie/lottie.dart';

final _formkey = GlobalKey<FormState>();

class phoneEmailVerifyScreen extends StatelessWidget {
  phoneEmailVerifyScreen({super.key});
  final gaurdinNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                  inputFormatters: [CapitalizeFirstLetterFormatter()],
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      value!.isEmpty ? "please enter the Gaurdian Name" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    if (value.length != 10) {
                      return 'Phone number must be 10 digits long';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Phone number must be a valid number';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            if (_formkey.currentState!.validate()) {
                              addContactDetails();
                              Navigator.of(context)
                                  .pushNamed('DestinationinfoScreen');
                            }
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
      ),
    );
  }

  Future<void> addContactDetails() async {
    final gaurdianName = gaurdinNameController.text;
    final email = emailController.text;
    final phoneNostr = phoneNumberController.text;
    final phoneNo = int.tryParse(phoneNostr);

    StudentDetail studentDetail = new StudentDetail();
    studentDetail.gurdianName = gaurdianName;
    studentDetail.email = email;
    studentDetail.phoneNumber = phoneNo!;
  }
}
