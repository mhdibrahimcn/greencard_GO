import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrBottomSheetScreen extends StatelessWidget {
  const qrBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: '1234567890',
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
