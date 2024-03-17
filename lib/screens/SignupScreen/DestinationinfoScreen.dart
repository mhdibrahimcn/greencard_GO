import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:lottie/lottie.dart';

class destinationInfoScreen extends StatelessWidget {
  destinationInfoScreen({super.key});
  final MonthSelectionNotifier _monthSelectionNotifier =
      MonthSelectionNotifier(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar.appBar("Desitination "),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset(
                "assets/location.json",
                width: 300,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Available Between',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 160,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Starting",
                          hintStyle: const TextStyle(color: Colors.white),
                          label: const Text(
                            "Starting",
                          ),
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
                    child: Text('And',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Ending",
                          hintStyle: const TextStyle(color: Colors.white),
                          label: const Text(
                            "Ending",
                          ),
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
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Time Period',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold))),
                ),
              ],
            ),
            ValueListenableBuilder<int>(
              valueListenable: _monthSelectionNotifier,
              builder: (context, selectedMonth, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: selectedMonth,
                        onChanged: (int? value) {
                          _monthSelectionNotifier.setSelectedMonth(value!);
                        },
                      ),
                      Text('1 Month'),
                      Radio(
                        value: 2,
                        groupValue: selectedMonth,
                        onChanged: (int? value) {
                          _monthSelectionNotifier.setSelectedMonth(value!);
                        },
                      ),
                      Text('2 Months'),
                    ],
                  ),
                );
              },
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
                            .pushNamed('PhoneEmailVerifyScreen'),
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

class MonthSelectionNotifier extends ValueNotifier<int> {
  MonthSelectionNotifier(int value) : super(value);

  void setSelectedMonth(int month) {
    value = month;
  }
}
