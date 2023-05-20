import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget dateCard(DocumentSnapshot doc, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(0),
    child: Card(
      elevation: 0,
      shadowColor: kTransparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                doc.id,
                style: const TextStyle(
                  color: kDarkBlue,
                  fontSize: 25,
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
                    onPressed: () {
                      Navigator.pushNamed(context, studentList, arguments : doc);
                    },
                    icon: const Icon(
                      Icons.exit_to_app_outlined,
                      color: kDarkBlue,
                      size: 35,
                    )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}