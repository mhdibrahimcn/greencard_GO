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
          backgroundColor: Color.fromARGB(255, 255, 239, 239),
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(52, 100, 230, 1),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset: Offset(10, 10),
                            )
                          ]),
                      height: 500,
                      width: 370,
                      child: qrBottomSheetScreen()),
                );
              },
            );
          },
          child: const Icon(Icons.qr_code),
        ),
      ),
    );
  }
}
