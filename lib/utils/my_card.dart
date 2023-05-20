import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

Widget myCard(String name, String rollNumber, String github, String linkedIn) {
  _launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  return Card(
    elevation: 0,
    shadowColor: kTransparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              name,
              style: const TextStyle(
                color: kDarkBlue,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Source Sans Pro',
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              rollNumber,
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
                  onPressed: () {
                    _launchURL(github);
                  },
                  icon: const Icon(
                    SimpleIcons.github,
                    color: kDarkBlue,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    _launchURL(linkedIn);
                  },
                  icon: const Icon(
                    SimpleIcons.linkedin,
                    color: kDarkBlue,
                    size: 35,
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
