import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/CapiialiseFirstLetter.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';
import 'package:lottie/lottie.dart';

final _formkey = GlobalKey<FormState>();

class addressVerifficationScreen extends StatelessWidget {
  addressVerifficationScreen({super.key});
  final depoNameContoller = TextEditingController();
  final districtContoller = TextEditingController();
  final cityContoller = TextEditingController();
  final pincodeContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              appbar.appBar("Address"),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                  "assets/Address.json",
                  width: 300,
                  height: 300,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 0, right: 8, left: 8, bottom: 8),
                child: TextFormField(
                  controller: depoNameContoller,
                  inputFormatters: [CapitalizeFirstLetterFormatter()],
                  validator: (value) =>
                      value!.isEmpty ? "please enter the Depo" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: "Enter Depo.....",
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Depo Name",
                      ),
                      prefixIcon: const Icon(Icons.departure_board),
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
                  controller: districtContoller,
                  inputFormatters: [CapitalizeFirstLetterFormatter()],
                  validator: (value) =>
                      value!.isEmpty ? "please enter the District" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: "District.....",
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "District",
                      ),
                      prefixIcon: const Icon(Icons.location_city),
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
                  controller: cityContoller,
                  inputFormatters: [CapitalizeFirstLetterFormatter()],
                  validator: (value) =>
                      value!.isEmpty ? "please enter the City" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: "City",
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "City",
                      ),
                      prefixIcon: const Icon(Icons.location_searching_rounded),
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
                  controller: pincodeContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pincode';
                    }
                    if (value.length != 6) {
                      return 'Phone number must be 6 digits long';
                    }
                    if (int.tryParse(value) == null) {
                      return 'pincode must be a valid number';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [LengthLimitingTextInputFormatter(6)],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Pincode",
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Pincode",
                      ),
                      prefixIcon: const Icon(Icons.location_history_sharp),
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
                padding: const EdgeInsets.only(right: 8),
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
                              addAddressDetails();
                              Navigator.of(context)
                                  .pushNamed('PasswordCreationScreen');
                            }
                          },
                          icon: const Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addAddressDetails() async {
    final deponame = depoNameContoller.text;
    final district = districtContoller.text;
    final city = cityContoller.text;
    final pincodestr = pincodeContoller.text;
    final pincode = int.tryParse(pincodestr);
    StudentDetail studentDetail = new StudentDetail();
    studentDetail.deponame = deponame;
    studentDetail.distict = district;
    studentDetail.city = city;
    studentDetail.pincode = pincode!;
  }
}
