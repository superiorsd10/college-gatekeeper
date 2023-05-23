import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
import '../utils/student_card.dart';

class DefaulterScreen extends StatefulWidget {
  const DefaulterScreen({super.key});

  @override
  State<DefaulterScreen> createState() => _DefaulterScreenState();
}

class _DefaulterScreenState extends State<DefaulterScreen> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: screenHeight / 200),
          child: Container(
            color: kWhite,
            child: StreamBuilder(
                stream: _firestore.collection("defaulters").snapshots(),
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
                            return ListTile(
                              title: Text(
                                doc.id,
                                style: const TextStyle(
                                  color: kDarkBlue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Source Sans Pro',
                                ),
                              ),
                            );
                          });
                    }
                  }
                }),
          ),
        ));
  }
}
