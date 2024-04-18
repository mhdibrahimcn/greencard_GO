import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User not logged in
      return Scaffold(
        body: Center(
          child: Text('User not logged in'),
        ),
      );
    }

    CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('Student_Travel');
    return Scaffold(
      appBar: CustomAppBar(label: "Travel History"),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 6),
        child: StreamBuilder<QuerySnapshot>(
          stream: studentCollection
              .doc(user.uid)
              .collection("Travel_History")
              .orderBy('travel_date', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('No travel history available.'),
              );
            }

            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot stdTravel = snapshot.data!.docs[index];
                Timestamp travelDate = stdTravel['travel_date'];
                String travelStatus = stdTravel['travel_status'];
                bool showDateDivider = index == 0 ||
                    snapshot.data!.docs[index - 1]['travel_date']
                            .toDate()
                            .day !=
                        travelDate.toDate().day;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showDateDivider)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Center(
                          child: Text(
                            parseDateDivider(travelDate),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 84,
                      child: Card(
                        color: Mycolors.materialColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 30,
                              child: Text(
                                parseDate(travelDate),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            title: Text(formatTime(travelDate)),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Icon(
                                    travelStatus == "Up"
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                  ),
                                ),
                                Text(
                                  travelStatus,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                );
              },
            );
          },
        ),
      ),
    );
  }

  String formatTime(Timestamp timestamp) {
    String formattedTime = DateFormat('h:mm a').format(timestamp.toDate());
    return formattedTime;
  }

  String parseDate(Timestamp timestamp) {
    final dated = DateFormat.MMMd().format(timestamp.toDate());
    final splitedDate = dated.split(' ');
    return '${splitedDate.last}\n ${splitedDate.first}';
  }

  String parseDateDivider(Timestamp timestamp) {
    final formattedDate = DateFormat('dd MMMM yyyy').format(timestamp.toDate());
    return '-------$formattedDate-------';
  }
}
