import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appbar.appBar('profile'),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: CircleAvatar(
                radius: 60,
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
        formdetails(Icon(Icons.person_2), 8, 18, "Name:", "Nikil prakash"),
        formdetails(Icon(Icons.phone), 8, 16, "Ph No  :", "9497484988"),
        formdetails(
            Icon(Icons.school), 8, 16, "Institution  :", "GPTC kalamassery"),
        formdetails(
          Icon(Icons.location_on),
          8,
          16,
          "Location :",
          "Skyline 13 b",
        ),
        formdetails(
          Icon(Icons.email),
          8,
          16,
          "Email:",
          "abcd@gmail.com",
        ),
        formdetails(
          Icon(Icons.card_membership_rounded),
          8,
          16,
          "Adhar No:",
          "235235235",
        ),
      ],
    );
  }

  Widget formdetails(Icon icon, double paddingleft, double paddingtop,
      String label, String labeldetails) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: paddingtop),
      child: Row(
        children: [
          icon,
          Padding(
            padding: EdgeInsets.only(left: paddingleft),
            child: Text(label),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              labeldetails,
              style: GoogleFonts.inter(
                  textStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
