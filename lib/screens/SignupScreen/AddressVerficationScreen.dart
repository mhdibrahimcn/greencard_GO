import 'package:flutter/material.dart';
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
              height: 30,
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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "123 Main St, City, State, ZIP Code",
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: "Address",
                  prefixIcon: const Icon(Icons.location_on),
                  filled: true,
                  fillColor: Mycolors.material_dark,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
                            .pushNamed('idVerificationScreen'),
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
