import 'package:flutter/material.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: Container(
        child: BottomAppBar(
          padding: const EdgeInsets.all(5),
          height: 60,
          elevation: 3,
          color: const Color.fromARGB(255, 52, 212, 233),
          notchMargin: 5.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 255, 239, 239),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 250, 244, 244),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
