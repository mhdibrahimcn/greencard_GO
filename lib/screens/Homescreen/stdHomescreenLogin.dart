import 'package:flutter/material.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:green/screens/Bottomnavigation/bottomnavigation.dart';
import 'package:green/screens/Homescreen/Profilescreen/profileScreen.dart';
import 'package:green/screens/Homescreen/TicketScreen/remaningScreenInTicket.dart';
import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';

class stdHomescreen extends StatelessWidget {
  stdHomescreen({super.key});

  final pages = const [
    remaningScreenInTicket(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig().SystemNavconfig(Color.fromARGB(255, 255, 255, 255));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 254, 255),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: floatingActionInNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation(),
      body: SafeArea(child: pages[0]),
    );
  }
}
