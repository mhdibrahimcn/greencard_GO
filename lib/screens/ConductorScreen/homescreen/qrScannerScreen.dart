import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:green/screens/ConductorScreen/homescreen/StudentDetailsScreen.dart';
import 'package:green/screens/ConductorScreen/homescreen/bottomnavigationConductor/bottomNavConductor.dart';
import 'package:green/screens/ConductorScreen/homescreen/conductorHomePage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  late CameraController? _cameraController;
  late QRViewController _qrViewController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  bool _isCameraInitialized = false;
  bool _isNavigating = false; // Flag to prevent multiple navigations

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _qrViewController.dispose(); // Dispose QRViewController
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await _cameraController!.initialize();

    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text('QR Scanner'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Point your camera at the QR code to scan',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 400,
            width: 400,
            child: _cameraController!.value.isInitialized
                ? QRView(
                    key: _qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 200, // Adjust the cutOutSize as needed
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;

    _qrViewController.scannedDataStream.listen((scanData) async {
      if (_isNavigating) return; // Check if already navigating

      _isNavigating = true; // Set navigating flag
      final studentCollection =
          FirebaseFirestore.instance.collection('studentDetails');
      final querySnapshot = await studentCollection.get();

      if (querySnapshot.docs.isNotEmpty) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var studentData = querySnapshot.docs[i].data();
          if (studentData['Student Id'] == scanData.code) {
            // Found the student matching the ticket ID
            var student = Student(
                name: studentData['Name'],
                studentid: studentData['Student Id'],
                institution: studentData['Institution'],
                startingDestination: studentData['Starting_Destination'],
                endingDestination: studentData["Ending_Destination"],
                ticketStartingDate: studentData["TicketStartingDate"],
                ticketEndingDate: studentData["TicketEndingDate"],
                profileDpURL: studentData["ProfilePictureUrl"]);

            bottomNavConductor.selectedIndex.value = 0;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetailsScreen(student: student),
              ),
            ).then((_) {
              _isNavigating =
                  false; // Reset navigating flag when navigation is complete
            });
            print("Success");
            return; // Exit the loop once the student is found
          }
        }
        print("Student not found");
      } else {
        print("No students found for the given ticket ID");
      }
    });
  }
}

class Student {
  final String name;
  final String studentid;
  final String institution;
  final String startingDestination;
  final String endingDestination;
  final String ticketStartingDate;
  final String ticketEndingDate;
  final String profileDpURL;
  Student(
      {required this.name,
      required this.studentid,
      required this.institution,
      required this.profileDpURL,
      required this.startingDestination,
      required this.endingDestination,
      required this.ticketStartingDate,
      required this.ticketEndingDate});
}
