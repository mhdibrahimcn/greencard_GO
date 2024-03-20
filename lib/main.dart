import 'package:flutter/material.dart';
import 'package:green/models/StudentDetail_model.dart';
import 'package:green/screens/Homescreen/stdHomescreenLogin.dart';
import 'package:green/screens/Login/stdLoginScreen.dart';
import 'package:green/screens/Login/stdRegistrationScreen.dart';
import 'package:green/screens/SignupScreen/AddressVerficationScreen.dart';
import 'package:green/screens/SignupScreen/DestinationinfoScreen.dart';
import 'package:green/screens/SignupScreen/PasswordCreationScreen.dart';
import 'package:green/screens/SignupScreen/SignupScreen.dart';
import 'package:green/screens/SignupScreen/idVerificationScreen.dart';
import 'package:green/screens/SignupScreen/phone_email_verify.dart';
import 'package:green/screens/SystemNavbarConfig/Systemnavbarconfig.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentsDetailModelAdapter().typeId)) {
    Hive.registerAdapter(StudentsDetailModelAdapter());
  }
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemNavbarconfig()
        .SystemNavconfig(const Color.fromARGB(116, 190, 239, 255));
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(114, 192, 202, 1),
          colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 97, 169, 179),
          )),
      debugShowCheckedModeBanner: false,
      home: const stdRegistrationScreen(),
      routes: {
        'stdRegistration': (context) => const stdRegistrationScreen(),
        'stdLoginscreen': (context) => const stdLoginScreen(),
        'stdHomeScreen': (context) => const stdHomescreen(),
        'SignUpScreen': (context) => signupScreen(),
        "PhoneEmailVerifyScreen": (context) => const phoneEmailVerifyScreen(),
        "DestinationinfoScreen": (context) => destinationInfoScreen(),
        "idVerificationScreen": (context) => const idVerificationScreen(),
        "AddressVerficationScreen": (context) =>
            const addressVerifficationScreen(),
        "PasswordCreationScreen": (context) => const passwordCreationScreen(),
      },
    );
  }
}
