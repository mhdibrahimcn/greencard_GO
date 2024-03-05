import 'package:flutter/material.dart';
import 'package:green/screens/Bottomnavigation/bottomnavigation.dart';

class homescreenLogin extends StatelessWidget {
  const homescreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.blue,
        backgroundColor: Color.fromARGB(255, 255, 239, 239),
        onPressed: () {},
        child: const Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
