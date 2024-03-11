import 'package:flutter/material.dart';
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
          Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              Text('Nikil prakash')
            ],
          ),
          QrImageView(
            data: '1234567890',
            version: QrVersions.auto,
            size: 230.0,
            eyeStyle: QrEyeStyle(
              color: Colors.black,
              eyeShape: QrEyeShape.square,
            ),
          ),
        ],
      ),
    );
  }
}
