import 'package:flutter/material.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:green/screens/Bottomnavigation/bottomnavigation.dart';
import 'package:green/screens/Homescreen/Profilescreen/profilescreen.dart';
import 'package:green/screens/Homescreen/Widget/ticketWidget.dart';
import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';

class stdHomescreen extends StatelessWidget {
  stdHomescreen({super.key});

  final pages = const [
    ticketWidget(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig().SystemNavconfig(Color.fromARGB(255, 255, 255, 255));
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: floatingActionInNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation(),
      body: SafeArea(child: pages[0]),
    );
  }
}
