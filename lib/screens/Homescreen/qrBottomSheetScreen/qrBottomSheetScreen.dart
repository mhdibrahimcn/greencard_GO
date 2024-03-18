import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrBottomSheetScreen extends StatelessWidget {
  const qrBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Nikil prakash',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: QrImageView(
                data: 'Azif',
                version: QrVersions.auto,
                size: 230.0,
                // ignore: deprecated_member_use
                foregroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(
                  color: Colors.black,
                  eyeShape: QrEyeShape.square,
                ),
              ),
            ),
          ),
          Text(
            'Scan to pay Bus ticket',
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Aluva',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
                ...List.generate(
                    4,
                    (index) => const Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 19,
                          color: Colors.white,
                        )),
                Text(
                  'Kalamassery',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          Text(
            'Ticket Id: 23456',
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
