import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:green/screens/Homescreen/TicketScreen/remaningScreenInTicket.dart';
import 'package:green/screens/Homescreen/qrBottomSheetScreen/qrBottomSheetScreen.dart';

import 'liquidcrystal/liquidcrysral.dart';

class travelUpDownStatusWidget extends StatefulWidget {
  final String student;
  const travelUpDownStatusWidget(this.student, {Key? key}) : super(key: key);

  @override
  _travelUpDownStatusWidgetState createState() =>
      _travelUpDownStatusWidgetState();
}

class _travelUpDownStatusWidgetState extends State<travelUpDownStatusWidget> {
  late String _travelStatus; // Variable to store travel status
  double _upValue = 0.1; // Default value for 'Up' status
  double _downValue = 0.1; // Default value for 'Down' status
  late Timer _timer;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _fetchTravelStatus(); // Fetch travel status when widget initializes
    _currentDate = DateTime.now();
    _startDailyTimer();
  }

  void _startDailyTimer() {
    const oneDay = Duration(days: 1);
    final tomorrow =
        DateTime(_currentDate.year, _currentDate.month, _currentDate.day + 1);
    final timeUntilTomorrow = tomorrow.difference(DateTime.now());

    _timer = Timer.periodic(oneDay, (Timer timer) {
      setState(() {
        _currentDate = DateTime.now();
      });
    });

    // Reset values at the start of the app if the day has already passed
    if (timeUntilTomorrow.isNegative) {
      _resetValues();
    }
  }

  void _resetValues() {
    setState(() {
      _upValue = 0.1; // Default value for 'Up' status
      _downValue = 0.1; // Default value for 'Down' status
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _fetchTravelStatus() async {
    CollectionReference studentTravelCollection =
        FirebaseFirestore.instance.collection('Student_Travel');

    QuerySnapshot querySnapshot = await studentTravelCollection
        .doc(widget.student)
        .collection("Travel_History")
        .orderBy('travel_date', descending: true)
        .limit(2) // Limiting to fetch the latest two travel statuses
        .get();

    // Reset values initially
    _resetValues();

    // Iterate over fetched documents
    for (var document in querySnapshot.docs) {
      var travelStatus = document['travel_status'] as String?;
      if (travelStatus == 'Up') {
        _upValue = 0.8; // Max value for 'Up' status
      } else if (travelStatus == 'Down') {
        _downValue = 0.8; // Max value for 'Down' status
      }
    }

    // Update both progress values if both statuses are present
    if (_upValue == 0.8 && _downValue == 0.8) {
      _upValue = 0.8;
      _downValue = 0.8;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.2,
                blurRadius: 50,
                offset: const Offset(
                  -13,
                  0,
                ),
              )
            ]),
            width: screenwidth * 0.4,
            height: screenheight * 0.1,
            child: LiquidLinearProgressIndicator(
              value: _downValue,
              valueColor: const AlwaysStoppedAnimation(
                Color.fromRGBO(114, 192, 202, 1),
              ),
              backgroundColor: Colors.white,
              borderColor: const Color.fromRGBO(114, 192, 202, 1),
              borderWidth: 3,
              borderRadius: 30.0,
              direction: Axis.vertical,
              center: const Text('Down'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.6,
                blurRadius: 20,
                offset: const Offset(
                  14,
                  7,
                ),
              )
            ]),
            width: screenwidth * 0.4,
            height: screenheight * 0.1,
            child: LiquidLinearProgressIndicator(
              value: _upValue,
              valueColor: const AlwaysStoppedAnimation(
                Color.fromRGBO(114, 192, 202, 1),
              ),
              backgroundColor: Colors.white,
              borderColor: const Color.fromRGBO(114, 192, 202, 1),
              borderWidth: 3.0,
              borderRadius: 30.0,
              direction: Axis.vertical,
              center: const Text('UP'),
            ),
          )
        ],
      ),
    );
  }
}
