import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavigation extends StatelessWidget {
  bottomNavigation({super.key});

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child: GNav(
              selectedIndex: selectedIndex.value,
              onTabChange: (value) {
                selectedIndex.value = value;
              },
              iconSize: 20,
              haptic: true,
              rippleColor: Color.fromRGBO(96, 149, 156, 1),
              activeColor: Colors.white,
              color: Color.fromRGBO(8, 14, 31, 1),
              backgroundColor: Color.fromRGBO(114, 192, 202, 1),
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
