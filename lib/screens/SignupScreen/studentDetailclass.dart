class StudentDetail {
  late String studentid;
  late String name;
  late String institution;
  late String dob;
  late String gurdianName;
  late int aadharNo;
  late String email;
  late int phoneNumber;
  late String password;
  late String startingDestination;
  late String endingDestination;
  late String period;
  late String deponame;
  late String distict;
  late String city;

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
    email = detail.email;
    phoneNumber = detail.phoneNumber;
    password = detail.password;
    startingDestination = detail.startingDestination;
    endingDestination = detail.endingDestination;
    period = detail.period;
    deponame = detail.deponame;
    distict = detail.distict;
    city = detail.city;
  }
}
