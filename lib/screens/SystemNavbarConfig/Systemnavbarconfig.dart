import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemNavbarconfig {
  void SystemNavconfig(Color statusColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: statusColor,
    ));
  }
}
