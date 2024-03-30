import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart'; // Import added here

final _formkey = GlobalKey<FormState>();

class idVerificationScreen extends StatefulWidget {
  idVerificationScreen({Key? key}) : super(key: key);

  @override
  _idVerificationScreenState createState() => _idVerificationScreenState();
}

class _idVerificationScreenState extends State<idVerificationScreen> {
  final aadharIdContoller = TextEditingController();
  File? _image;

  Future<void> _getImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image picked successfully')),
      );

      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(label: "Id verification"),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                  "assets/Card.json",
                  width: 300,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: Card(
                    color: Mycolors.materialColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _image == null
                            ? CircleAvatar(
                                radius: 70,
                                child: Icon(Icons.person),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(_image!),
                              ),
                        ElevatedButton(
                          onPressed: () => _getImage(context),
                          child: Text('Pick Image'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: aadharIdContoller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(12)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Aadhar number';
                    }
                    if (value.length != 12) {
                      return 'Aadhar number must be 12 digits long';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Aadhar number must be an integer';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "xxxx - xxxx  - xxxx",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 19),
                    label: Text("Aadhar No"),
                    prefixIcon: Icon(EvaIcons.creditCard),
                    filled: true,
                    fillColor: Mycolors.material_dark,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const SizedBox(
                  height: 20), // Display picked image in CircleAvatar
              Padding(
                padding: const EdgeInsets.only(top: 0.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Mycolors.materialColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            addIdDetails();
                            Navigator.of(context).pushNamed(
                              'AddressVerficationScreen',
                            );
                          }
                        },
                        icon: Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addIdDetails() async {
    final aadharidstr = aadharIdContoller.text;
    final aadharid = int.tryParse(aadharidstr);
    StudentDetail studentDetail = new StudentDetail();
    studentDetail.aadharNo = aadharid!;
  }
}
