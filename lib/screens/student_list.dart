import 'package:college_gatekeeper/constants.dart';
import 'package:college_gatekeeper/utils/student_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/date_card.dart';

class DateList extends StatefulWidget {
  const DateList({super.key});

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: kWhite,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight / 200,
        ),
        child: StreamBuilder(
            stream: _firestore.collection("data").orderBy('Server Timestamp', descending: true).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      // print(snapshot.data);
                      return dateCard(doc, context);
                    });
              }
            }),
      ),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        title: Text(
          args.id,
          style: const TextStyle(
            color: kWhite,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Source Sans Pro',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: kWhite,
            ),
            onSelected: (String result) {
              switch (result) {
                case 'Profile':
                  Navigator.pushReplacementNamed(context, profile);
                  // print('filter 1 clicked');
                  break;
                case 'About Team':
                  Navigator.pushReplacementNamed(context, aboutTeam);
                  // print('filter 2 clicked');
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'About Team',
                child: Text(
                  'About Team',
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight / 200),
        child: Container(
          color: kWhite,
          child: StreamBuilder(
              stream: _firestore
                  .collection("data")
                  .doc(args.id)
                  .collection("entries")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.data!.docs.length == 0) {
                    return Text("No Data");
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = snapshot.data!.docs[index];
                          print(snapshot.data!.docs.length);
                          return StudentCard(
                            doc: doc,
                          );
                        });
                  }
                }
              }),
        ),
      ),
    );
  }
}
