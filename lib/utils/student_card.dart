import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCard extends StatelessWidget {
  StudentCard({super.key, required this.doc});

  final DocumentSnapshot doc;

  // Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  Map<String, dynamic> myData = {
    "Out Time" : "1",
  };
  Future<Map<String, dynamic>> _getStudentInfo() async {
    myData = doc.data() as Map<String, dynamic>;
    String rollno = doc.id;
    dynamic student_data_ref = await FirebaseFirestore.instance
        .collection("students")
        .doc(rollno)
        .get();
    Map<String, dynamic> student_data =
        student_data_ref.data() as Map<String, dynamic>;
    // print(student_data);
    return student_data;
  }

  @override
  Widget build(BuildContext context) {
    // String name = await _getStudentInfo();
    return FutureBuilder(
      future: _getStudentInfo(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // print("My phone number is : ${snapshot.data!["Phone number"]}");
          return Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              elevation: 0,
              shadowColor: kTransparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ExpansionTile(
                    title: Text(
                      doc.id,
                      style: const TextStyle(
                        color: kDarkBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            snapshot.data!["Student's Name"],
                            style: const TextStyle(
                              color: kDarkBlue,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source Sans Pro',
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            "Out Time :-        ${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch((myData['Out Time'] as Timestamp).millisecondsSinceEpoch))}",
                            style: const TextStyle(
                              color: kDarkBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source Sans Pro',
                            ),
                          ),
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => launchUrl(Uri.parse('tel:+91 ${snapshot.data!["Phone number"]}')),
                                icon: const Icon(
                                  Icons.call,
                                  color: kDarkGreen,
                                  size: 35,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
