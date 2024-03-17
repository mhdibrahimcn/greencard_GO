import 'package:flutter/material.dart';

class historyScreen extends StatelessWidget {
  const historyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 84,
              child: Card(
                color: const Color.fromARGB(255, 238, 209, 243),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: const ListTile(
                  trailing: Text("heloo"),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: 20),
    );
  }
}
