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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(0, 95, 153, 1),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
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
                    color: Color.fromRGBO(0, 95, 153, 1),
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
                        color: Color.fromRGBO(0, 95, 153, 1),
                      ),
                    ),
                    hintText: 'Enter your email',
                    focusColor: Color.fromRGBO(0, 95, 153, 1),
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
                    backgroundColor: const Color.fromRGBO(0, 131, 37, 1),
                  ),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
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
