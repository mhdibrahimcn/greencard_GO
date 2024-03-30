import 'package:flutter/material.dart';

import 'package:green/screens/ConductorScreen/homescreen/bottomnavigationConductor/bottomNavConductor.dart';
import 'package:green/screens/ConductorScreen/homescreen/conductorHomePage.dart';
import 'package:green/screens/ConductorScreen/homescreen/qrScannerScreen.dart';

class conductorHomeScreen extends StatelessWidget {
  conductorHomeScreen({super.key});
  final pages = [conductorHomePage(), QRScannerScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      // floatingActionButton: const floatingActionInNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: const bottomNavConductor(),
      body: ValueListenableBuilder(
        valueListenable: bottomNavConductor.selectedIndex,
        builder: (BuildContext context, int newvalue, _) {
          return pages[newvalue];
        },
      ),
    );
  }
}
