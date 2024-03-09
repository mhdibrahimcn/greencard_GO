import 'package:flutter/material.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:green/screens/Bottomnavigation/bottomnavigation.dart';

class stdHomescreen extends StatelessWidget {
  const stdHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: floatingActionInNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
