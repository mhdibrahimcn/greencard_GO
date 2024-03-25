import 'package:flutter/material.dart';
import 'package:green/constants/Mycolors.dart';
import 'package:green/db/stdTravelHistoryDB.dart';
import 'package:green/models/StudentTravelHistory_model.dart';
import 'package:green/screens/Homescreen/Profilescreen/appbar/appbar.dart';
import 'package:intl/intl.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<historyScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    // Cancel any ongoing operations here
    super.dispose();
  }

  void fetchData() async {
    // Simulate fetching data
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      // Check if the widget is still in the tree
      StdTravelHistoryDb().refreshUi();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel History"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : ValueListenableBuilder(
              valueListenable:
                  StdTravelHistoryDb.instance.stdTravelModelNotifier,
              builder: (BuildContext context,
                  List<StudentTravelHistory_model> newList, _) {
                if (newList.isEmpty) {
                  // Display a message when the list is empty
                  return Center(
                    child: Text(
                      'No travel history available.',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                } else {
                  // Display the ListView when the list is not empty
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final stdTravel = newList[index];
                      return SizedBox(
                        height: 84,
                        child: Card(
                          color: Mycolors.materialColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 30,
                                child: Text(
                                  parseDate(stdTravel.travelDate),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              title: Text(formatTime(stdTravel.travelDate)),
                              trailing: stdTravel.travelStatus == "Up"
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_upward),
                                        SizedBox(height: 4),
                                        Text("Up"),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_downward),
                                        SizedBox(height: 4),
                                        Text("Down"),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: newList.length,
                  );
                }
              },
            ),
    );
  }
}

String formatTime(DateTime dateTime) {
  // Format the DateTime object to "h:mm a" format
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}

String parseDate(DateTime date) {
  final dated = DateFormat.MMMd().format(date);
  final splitedDate = dated.split(' ');
  return '${splitedDate.last}\n ${splitedDate.first}';
}
