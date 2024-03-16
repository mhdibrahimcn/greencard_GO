import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appbar {
  static Widget appBar(String label) {
    return Container(
      height: 130,
      width: double.infinity,
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
          label,
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
