import 'package:flutter/services.dart';

class SystemNavbarconfig {
  void SystemNavconfig(Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: navColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
