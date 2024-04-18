import 'dart:io';

import 'package:flutter/material.dart';

class StudentDetail {
  late String uid;
  late String studentid;
  late String name;
  late String institution;
  late String dob;
  late String gurdianName;
  late int aadharNo;
  late String profileDpURL;
  late String email;
  late int phoneNumber;

  late String startingDestination;
  late String endingDestination;
  late String period;
  late String deponame;
  late String distict;
  late String city;
  late int pincode;
  late String ticketStartingDate;
  late String ticketEndingDate;

  StudentDetail._internal();
  static StudentDetail instance = StudentDetail._internal();
  factory StudentDetail() {
    return instance;
  }

  void updateFormValues(StudentDetail detail) {
    studentid = detail.studentid;
    name = detail.name;
    institution = detail.institution;
    dob = detail.dob;
    gurdianName = detail.gurdianName;
    aadharNo = detail.aadharNo;
    profileDpURL = detail.profileDpURL;
    email = detail.email;
    phoneNumber = detail.phoneNumber;
    uid = detail.uid;
    startingDestination = detail.startingDestination;
    endingDestination = detail.endingDestination;
    period = detail.period;
    deponame = detail.deponame;
    distict = detail.distict;
    city = detail.city;
    pincode = detail.pincode;
    ticketStartingDate = detail.ticketStartingDate;
    ticketEndingDate = detail.ticketEndingDate;
  }
}
