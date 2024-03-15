import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemNavbarconfig {
  void SystemNavconfig(Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: navColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Color.fromRGBO(114, 192, 202, 1),
    ));
  }
}
