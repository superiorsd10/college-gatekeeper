import 'package:college_gatekeeper/constants.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController? _emailController;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        shadowColor: kTransparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDarkBlue,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, login);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight / 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth / 5),
                child: const Text(
                  "Enter your email to receive\npassword reset link",
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: screenHeight / 18,
              ),

              //! email field
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth / 8, 0, screenWidth / 8, screenWidth / 7),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kDarkBlue,
                      ),
                    ),
                    hintText: 'Enter your email',
                    focusColor: kDarkBlue,
                  ),
                ),
              ),

              //! reset password button
              SizedBox(
                height: screenHeight / 20,
                width: screenWidth / 2,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: kDarkGreen,
                  ),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
