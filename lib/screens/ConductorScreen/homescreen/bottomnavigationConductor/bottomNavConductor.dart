import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavConductor extends StatelessWidget {
  const bottomNavConductor({super.key});

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(70)),
        child: GNav(
          selectedIndex: selectedIndex.value,
          onTabChange: (value) {
            selectedIndex.value = value;
          },
          iconSize: 27,
          haptic: true,
          rippleColor: const Color.fromRGBO(96, 149, 156, 1),
          activeColor: Colors.white,
          color: const Color.fromRGBO(8, 14, 31, 1),
          backgroundColor: const Color.fromRGBO(114, 192, 202, 1),
          gap: 3,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
