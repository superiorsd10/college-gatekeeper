import 'package:flutter/material.dart';
import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //! AppBar
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
      //! Body
      body: Container(
        color: kWhite,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! profile icon
                Icon(
                  Icons.account_circle_outlined,
                  size: screenHeight / 5,
                  color: kDarkBlue,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //! Username
                Text(
                  "HELLO THERE",
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //! User email ID
                Text(
                  "abcd@gmail.com",
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 7,
            ),
            //! Logout Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 3),
              child: SizedBox(
                width: screenWidth/3,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 96, 82, 1),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
