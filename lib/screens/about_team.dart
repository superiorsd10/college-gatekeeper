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
            myCard("Sachin Dapkara", "LCS2021001", "https://github.com/superiorsd10", "https://www.linkedin.com/in/sachin-dapkara/"),
            myCard("Anikate Koul", "LCS2021012", "https://github.com/AnikateKoul", "https://www.linkedin.com/in/anikate-koul-9959b2228/"),
            myCard("Abhishek Goenka", "LCS2021005", "https://github.com/Abhi01goenka", "https://www.linkedin.com/in/abhishek-goenka-9b0374229/"),
            myCard("Rudranil Acharya", "LIT2021006", "https://github.com/rudranil01", "https://www.linkedin.com/in/rudranil-acharya-0b7a07223/"),
            myCard("Pallavi Bahekar", "LCI2021041", "https://github.com/Pallavibahekar", "https://www.linkedin.com/in/pallavi-bahekar-9b904922a/"),

          ],
        ),
      ),
    );
  }
}
