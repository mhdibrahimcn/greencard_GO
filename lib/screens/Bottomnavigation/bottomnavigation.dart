import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child: GNav(
              selectedIndex: 0,
              onTabChange: (value) {},
              iconSize: 20,
              haptic: true,
              rippleColor: Color.fromRGBO(100, 141, 252, 1),
              activeColor: Colors.white,
              color: Color.fromRGBO(8, 14, 31, 1),
              backgroundColor: Color.fromRGBO(52, 100, 230, 1),
              gap: 15,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.payment,
                  text: 'Payment',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'profile',
                ),
              ])),
    );
  }
}
