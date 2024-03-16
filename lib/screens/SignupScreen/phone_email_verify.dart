import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';

class phoneEmailVerifyScreen extends StatelessWidget {
  const phoneEmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar.appBar("Contact Verification"),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Opacity(
              opacity: 0.7,
              child: Image(
                image: AssetImage("assets/telephone.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
