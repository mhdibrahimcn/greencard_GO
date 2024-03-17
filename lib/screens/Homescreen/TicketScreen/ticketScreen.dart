import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/screens/Bottomnavigation/FloatingAction/FloatingActionInNav.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticketscreen extends StatelessWidget {
  const Ticketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 330,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Aluva',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'In',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17, top: 10),
                    child: Column(
                      children: [
                        ...List.generate(
                            2,
                            (index) => const Icon(
                                  Icons.arrow_drop_down_circle_sharp,
                                  size: 20,
                                  color: Colors.white60,
                                )),
                        Text(
                          "To",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ...List.generate(
                            2,
                            (index) => const Icon(
                                  Icons.arrow_drop_down_circle_sharp,
                                  size: 20,
                                  color: Colors.white60,
                                )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Kalamassery',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'Out',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '26 th january',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  ...List.generate(
                      2,
                      (index) => const Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            size: 20,
                            color: Colors.white60,
                          )),
                  Text(
                    '02 th Feb',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextButton(
                    onPressed: () => floatingActionInNav.bottomSheet(context),
                    child: QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 70.0,
                      eyeStyle: const QrEyeStyle(
                        color: Colors.black,
                        eyeShape: QrEyeShape.square,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
