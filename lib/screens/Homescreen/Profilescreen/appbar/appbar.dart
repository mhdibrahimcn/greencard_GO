import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appbar {
  static Widget appBar(String label) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(114, 192, 202, 1),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.6,
              blurRadius: 20,
              offset: const Offset(
                14,
                7,
              ),
            )
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            label,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
