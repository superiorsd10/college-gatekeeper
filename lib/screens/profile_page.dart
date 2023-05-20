import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;

    Future<dynamic> getName() async {
      dynamic adminDataRef = await _firestore
          .collection('admin')
          .doc(_auth.currentUser!.email)
          .get();
      Map<String, dynamic> adminData =
          adminDataRef.data() as Map<String, dynamic>;
      return adminData;
    }

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
        title: const Text(
          "College GateKeeper",
          style: TextStyle(
            color: kWhite,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Source Sans Pro',
          ),
        ),
      ),
      //! Body
      body: FutureBuilder(
        future: getName(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
                    children: [
                      //! Username
                      Text(
                        snapshot.data['name'],
                        style: const TextStyle(
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
                    children: [
                      //! User email ID
                      Text(
                        _auth.currentUser!.email!,
                        style: const TextStyle(
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
                      width: screenWidth / 3,
                      child: TextButton(
                        onPressed: () {
                          _auth.signOut();
                          Navigator.pushReplacementNamed(
                              context, statePersistence);
                        },
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
            );
          }
          else{
            return const Center(
            child: CircularProgressIndicator(),
          );
          }
        },
      ),
    );
  }
}
