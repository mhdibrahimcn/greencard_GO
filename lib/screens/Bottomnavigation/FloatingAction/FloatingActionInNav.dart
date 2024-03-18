import 'package:flutter/material.dart';
import 'package:green/screens/Homescreen/qrBottomSheetScreen/qrBottomSheetScreen.dart';

class floatingActionInNav extends StatelessWidget {
  const floatingActionInNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          hoverColor: Colors.blue,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            bottomSheet(context);
          },
          child: const Icon(
            Icons.qr_code,
            color: Color.fromRGBO(84, 143, 151, 1),
          ),
        ),
      ),
    );
  }

  static bottomSheet(BuildContext context) async {
    showBottomSheet(
      context: context,
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      builder: (context1) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(79, 146, 155, 1),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(1),
                  spreadRadius: 10,
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            height: 500,
            width: 370,
            child: const qrBottomSheetScreen(),
          ),
        );
      },
    );
  }
}
