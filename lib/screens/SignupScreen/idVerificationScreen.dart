import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:green/screens/SignupScreen/studentDetailclass.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart'; // Import added here
import 'package:firebase_auth/firebase_auth.dart';

final _formkey = GlobalKey<FormState>();

class IdVerificationScreen extends StatefulWidget {
  IdVerificationScreen({Key? key}) : super(key: key);

  @override
  _IdVerificationScreenState createState() => _IdVerificationScreenState();
}

class _IdVerificationScreenState extends State<IdVerificationScreen> {
  final aadharIdController = TextEditingController();
  File? _image;

  String? _validateImage(File? image) {
    if (image == null) {
      return 'Please pick an image';
    }
    return null;
  }

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
                  controller: aadharIdController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(12)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an Aadhar number';
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
              const SizedBox(height: 20),
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
                            String? imageError = _validateImage(_image);
                            if (imageError == null) {
                              addIdDetails();
                              Navigator.of(context).pushNamed(
                                'AddressVerificationScreen',
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(imageError)),
                              );
                            }
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
    final aadharIdStr = aadharIdController.text;
    final aadharId = int.tryParse(aadharIdStr);

    if (aadharId == null || _image == null) {
      // Handle error appropriately
      return;
    }

    // Check if user is authenticated
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User is not authenticated
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not authenticated')),
      );
      return;
    }

    // Assuming _image is a File object representing the image
    final File profileDp = _image!;

    StudentDetail studentDetail = StudentDetail();
    studentDetail.aadharNo = aadharId;
    studentDetail.studentid =
        user.uid; // Assuming user ID is used for student ID

    // Upload image to Firebase Storage
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('${studentDetail.studentid}.jpg');

    try {
      // Upload the image file to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(profileDp);

      // Wait for the image to be uploaded and get the download URL
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Save the image URL in the student details
      studentDetail.profileDpURL = imageUrl;

      // Update student details in your database (not shown in this code)
      // ...

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ID Details added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    }
  }
}
