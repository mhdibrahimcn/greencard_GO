import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/Mycolors.dart';

import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/CapiialiseFirstLetter.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';

import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

final _formkey = GlobalKey<FormState>();

class signupScreen extends StatefulWidget {
  signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final _namecontroller = TextEditingController();

  final _institutioncontroller = TextEditingController();

  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController.text = "Date Of Birth";
  }

  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig().SystemNavconfig(Mycolors.materialColor);
    return Scaffold(
      appBar: CustomAppBar(label: "Personal Detail"),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
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
                  inputFormatters: [CapitalizeFirstLetterFormatter()],
                  controller: _namecontroller,
                  validator: (value) =>
                      value!.isEmpty ? "please enter Full Name" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  controller: _institutioncontroller,
                  inputFormatters: [CapitalizeFirstLetterFormatter()],
                  validator: (value) =>
                      value!.isEmpty ? "please enter the Institurion" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  validator: (value) =>
                      value!.isEmpty ? "please Select the Date" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Mycolors.material_dark,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
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
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              addPersonalDetails();

                              Navigator.of(context)
                                  .pushNamed('PhoneEmailVerifyScreen');
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text = picked.toString().split(' ')[0];
      });
  }

  Future<void> addPersonalDetails() async {
    final fullname = _namecontroller.text;
    final institutionName = _institutioncontroller.text;
    final dob = dateController.text;
    String stdId = generateCustomUUID();
    StudentDetail studentDetail = new StudentDetail();
    studentDetail.studentid = stdId;
    studentDetail.name = fullname;
    studentDetail.institution = institutionName;
    studentDetail.dob = dob;
  }
}

String generateCustomUUID() {
  var uuid = Uuid();
  // Generate a random UUID
  String randomUUID = uuid.v4();

  // Extract the last 5 digits from the UUID
  String lastFiveDigits = randomUUID.substring(randomUUID.length - 5);

  // Concatenate "40" with the last 5 digits to form the custom UUID
  String customUUID = "40" + lastFiveDigits;

  return customUUID;
}
