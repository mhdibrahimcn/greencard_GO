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
              rippleColor: Colors.yellow,
              tabBackgroundColor: Color.fromARGB(255, 231, 220, 116),
              activeColor: const Color.fromARGB(255, 0, 0, 0),
              backgroundColor: Color.fromARGB(248, 116, 188, 236),
              gap: 40,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'profile',
                )
              ])),
    );
  }
}
