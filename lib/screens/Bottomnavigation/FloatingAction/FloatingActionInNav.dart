import 'package:flutter/material.dart';

class floatingActionInNav extends StatelessWidget {
  const floatingActionInNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        hoverColor: Colors.blue,
        backgroundColor: Color.fromARGB(255, 255, 239, 239),
        onPressed: () {},
        child: const Icon(Icons.qr_code),
      ),
    );
  }
}
