import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/ConductorScreen/homescreen/bottomnavigationConductor/bottomNavConductor.dart';
import 'package:ticket_widget/ticket_widget.dart';

class conductorHomeScreen extends StatelessWidget {
  const conductorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      // floatingActionButton: const floatingActionInNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const bottomNavConductor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInLeft(
                    duration: const Duration(milliseconds: 700),
                    child: Text(
                      "Hello User!!",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeInRight(
                    duration: const Duration(milliseconds: 700),
                    child: const CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.6,
                  blurRadius: 20,
                  offset: const Offset(
                    14,
                    7,
                  ),
                )
              ]),
              child: TicketWidget(
                color: Color.fromRGBO(114, 192, 202, 1),
                width: 350,
                height: 227,
                padding: EdgeInsets.all(7),
                isCornerRounded: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        "Travel Route",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aluva",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...List.generate(
                          2,
                          (index) => const Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 20,
                            color: Colors.white60,
                          ),
                        ),
                        Text(
                          "To",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...List.generate(
                          2,
                          (index) => const Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 20,
                            color: Colors.white60,
                          ),
                        ),
                        Text(
                          "Kalamassery",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0.6,
                    blurRadius: 20,
                    offset: const Offset(
                      14,
                      7,
                    ),
                  ),
                ],
                color: Mycolors.materialColor,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(5)],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter Student ID",
                            filled: true,
                            fillColor: Color.fromARGB(255, 112, 185, 195),
                            hintStyle: const TextStyle(color: Colors.white),
                            label: const Text(
                              "Student ID",
                            ),
                            prefixIcon:
                                const Icon(Icons.location_history_sharp),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          print("sdfv");
                        },
                        child: Icon(Icons.qr_code),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the value to get a squircle shape
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
