import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/Homescreen/Profilescreen/widget/roundedbutton.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String phonenumber;
  const OtpScreen(this.phonenumber, {Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  int _timerCount = 29;
  late Timer _timer;
  bool verification = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerCount == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _timerCount--;
          });
        }
      },
    );
  }

  Future<void> verifyPhone() async {
    startTimer();
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      _auth.signInWithCredential(authResult);
      setState(() {
        verification = true;
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Error: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, int? resendToken) {
      this.verificationId = verId;
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${widget.phonenumber}",
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  Future<void> signInWithOTP() async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: _otpController.text,
      );
      await _auth.signInWithCredential(credential);
      // Navigate to next screen after successful authentication
      Navigator.of(context).pushNamed("DestinationinfoScreen");
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final borderColor = Mycolors.materialColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(label: 'OTP Verification'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                  "assets/verification.json",
                  width: 300,
                  height: 300,
                ),
              ),
              Center(
                  child: Text(
                      "OTP will sent to +91${widget.phonenumber} (${_timerCount.toString()}s left)")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                    label: "Send OTP",
                    onPressed: verifyPhone,
                    isSelected: true),
              ),
              SizedBox(height: 32.0),
              Pinput(
                length: 6,
                controller: _otpController,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return verification == true ? "Succesfull" : "Code is error";
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                pinAnimationType: PinAnimationType.fade,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              SizedBox(height: 16.0),
              RoundedButton(
                  label: "Verify OTP",
                  onPressed: signInWithOTP,
                  isSelected: true)
            ],
          ),
        ),
      ),
    );
  }
}
