import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:green/screens/Homescreen/Profilescreen/widget/roundedbutton.dart';

class PersonDetailScreen extends StatefulWidget {
  final DocumentSnapshot student;
  const PersonDetailScreen(DocumentSnapshot<Object?> this.student, {super.key});

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

int _selectedIndex = 0;

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              label: 'Personal Details',
              onPressed: () {
                setState(() {
                  _selectedIndex = 0; // Set selected index
                });
              },
              isSelected: _selectedIndex == 0, // Check if selected
            ),
            SizedBox(height: 20),
            RoundedButton(
              label: 'Address Details',
              onPressed: () {
                setState(() {
                  _selectedIndex = 1; // Set selected index
                });
              },
              isSelected: _selectedIndex == 1, // Check if selected
            ),
          ],
        ),
        if (_selectedIndex == 0) ...[
          SizedBox(
            height: 20,
          ),
          personalDetailText(
              "Ph no", "+91 ${widget.student["PhoneNumber"].toString()}"),
          SizedBox(
            height: 8,
          ),
          personalDetailText("Student ID", widget.student["Student Id"]),
          SizedBox(
            height: 8,
          ),
          personalDetailText("Date of birth", widget.student["Dob"]),
          SizedBox(
            height: 8,
          ),
          personalDetailText(
              "Aadhar No", widget.student["Aadhar_no"].toString()),
          SizedBox(
            height: 8,
          ),
        ] else ...[
          SizedBox(
            height: 20,
          ),
          personalDetailText("Depo Name:", widget.student["Depo_name"]),
          SizedBox(
            height: 8,
          ),
          personalDetailText(
              "Destination In:", widget.student["Starting_Destination"]),
          SizedBox(
            height: 8,
          ),
          personalDetailText(
              "Destination Out:", widget.student["Ending_Destination"]),
          SizedBox(
            height: 8,
          ),
          personalDetailText("City", widget.student["City"]),
          SizedBox(
            height: 8,
          ),
        ],
      ],
    );
  }
}

Widget personalDetailText(label, content) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("   $label",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            )),
        Text(
          " $content     ",
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}
