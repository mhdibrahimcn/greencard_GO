import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appbar(),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CircleAvatar(
            radius: 70,
            child: Icon(Icons.person),
          ),
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

  Widget appbar() {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
          color: Color.fromRGBO(114, 192, 202, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.6,
              blurRadius: 20,
              offset: Offset(
                14,
                7,
              ),
            )
          ]),
      child: Center(
        child: Text(
          'Profile',
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
