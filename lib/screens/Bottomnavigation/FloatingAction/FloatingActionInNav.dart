import 'package:flutter/material.dart';

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
                    color: Colors.greenAccent,
                    height: 500,
                    width: 380,
                    child: Text('hello'),
                  ),
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
