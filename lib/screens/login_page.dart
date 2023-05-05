import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_gatekeeper/admin_password.dart';
import 'package:college_gatekeeper/services/firebase_auth_methods.dart';
import 'package:college_gatekeeper/utils/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool passUserPassword = true;
  bool passAdminPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  bool _loading = false;

  Future<void> signInUser() async {
    if (confirmAdminPassword()) {
      await FirebaseAuthMethods(
              FirebaseAuth.instance, FirebaseFirestore.instance)
          .signInWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );
      Navigator.pushReplacementNamed(context, home);
    } else {
      showSnackBar(context, 'Incorrect Admin Password');
    }
  }

  bool confirmAdminPassword() {
    return _adminPasswordController.text.trim() == admin_password;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: kWhite,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //! Logo
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth / 4),
                    child: Image.asset(
                      'images/splash_image.png',
                      height: screenHeight / 4,
                      width: screenWidth / 2,
                    ),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: kDarkBlue,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),

                  //! Email field
                  SizedBox(
                    height: screenHeight / 9.36,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth / 8,
                          screenWidth / 25, screenWidth / 8, screenWidth / 25),
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
                          errorStyle: TextStyle(
                            color: kRed,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  //! password field
                  SizedBox(
                    height: screenHeight / 10.4,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth / 8,
                          screenWidth / 25, screenWidth / 8, screenWidth / 25),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: passUserPassword,
                        decoration: InputDecoration(
                          suffix: IconButton(
                            icon: Icon(
                              passUserPassword == true
                                  ? Icons.remove_red_eye
                                  : Icons.password,
                            ),
                            onPressed: () {
                              setState(() {
                                if (passUserPassword) {
                                  passUserPassword = false;
                                } else {
                                  passUserPassword = true;
                                }
                              });
                            },
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: kDarkBlue,
                          )),
                          hintText: 'Enter your password',
                          focusColor: kDarkBlue,
                          errorStyle: const TextStyle(
                            color: kRed,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  //! admin password field
                  SizedBox(
                    height: screenHeight / 9.36,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth / 8,
                          screenWidth / 15, screenWidth / 8, screenWidth / 25),
                      child: TextFormField(
                        controller: _adminPasswordController,
                        obscureText: passAdminPassword,
                        decoration: InputDecoration(
                          suffix: IconButton(
                            icon: Icon(passAdminPassword == true
                                ? Icons.remove_red_eye
                                : Icons.password),
                            onPressed: () {
                              setState(() {
                                if (passAdminPassword) {
                                  passAdminPassword = false;
                                } else {
                                  passAdminPassword = true;
                                }
                              });
                            },
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: kDarkBlue,
                          )),
                          hintText: 'Enter admin password',
                          focusColor: kDarkBlue,
                          errorStyle: const TextStyle(
                            color: kRed,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Admin Password!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 2),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, forgotPassword);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: kDarkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 22.5,
                  ),

                  //!login button
                  SizedBox(
                    height: screenHeight / 19,
                    width: screenWidth / 2.46,
                    child: _loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kDarkBlue,
                            ),
                          )
                        : TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                _formKey.currentState!.save();
                                await signInUser();
                                setState(() {
                                  _loading = false;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  kDarkGreen,
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Source Sans Pro',
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: screenHeight / 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: kDarkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //* moving to register page
                          Navigator.pushReplacementNamed(context, register);
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            color: kDarkBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 13,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
