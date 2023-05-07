import 'package:flutter/material.dart';
import '../constants.dart';
import '../utils/my_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //! double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        shadowColor: kTransparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kWhite,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, home);
          },
        ),
      ),
      body: Container(
        color: kWhite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight/10,),
                const Text(
                  "Team",
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight / 40),
            myCard("Sachin Dapkara", "LCS2021001", "github", "linkedIn"),
            myCard("Anikate Koul", "LCS2021012", "github", "linkedIn"),
            myCard("Abhishek Goenka", "LCS2021005", "github", "linkedIn"),
            myCard("Rudranil Acharya", "LIT2021006", "github", "linkedIn"),
            myCard("Pallavi Bahekar", "LCI2021041", "github", "linkedIn"),

          ],
        ),
      ),
    );
  }
}
