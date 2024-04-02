import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isSelected;

  const RoundedButton({
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function(),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: isSelected
              ? Mycolors.materialColor
              : Color.fromARGB(101, 120, 230, 244),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
