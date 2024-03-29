import 'package:flutter/material.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:green/screens/Bottomnavigation/bottomnavigation.dart';
import 'package:green/screens/Homescreen/HistoryScreen/historyScreen.dart';
import 'package:green/screens/Homescreen/PaymentScreen/paymentScreen.dart';
import 'package:green/screens/Homescreen/Profilescreen/profileScreen.dart';
import 'package:green/screens/Homescreen/TicketScreen/remaningScreenInTicket.dart';
import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';

class stdHomescreen extends StatelessWidget {
  const stdHomescreen({super.key});

  final pages = const [
    remaningScreenInTicket(),
    paymentScreen(),
    historyScreen(),
    // profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig()
        .SystemNavconfig(const Color.fromRGBO(114, 192, 202, 1));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: const floatingActionInNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const bottomNavigation(),
      body: ValueListenableBuilder(
        valueListenable: bottomNavigation.selectedIndex,
        builder: (BuildContext context, int newvalue, _) {
          return pages[newvalue];
        },
      ),
    );
  }
}
