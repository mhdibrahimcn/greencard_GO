import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: GNav(
            tabBackgroundColor: Colors.grey,
            activeColor: Colors.white,
            backgroundColor: Colors.blue,
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
            ]));
  }
}
