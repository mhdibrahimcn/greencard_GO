import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:lottie/lottie.dart';

class addressVerifficationScreen extends StatelessWidget {
  const addressVerifficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
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
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
                        onPressed: () => Navigator.of(context)
                            .pushNamed('PasswordCreationScreen'),
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
    );
  }
}
