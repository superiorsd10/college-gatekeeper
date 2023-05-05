import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_gatekeeper/admin_password.dart';
import 'package:college_gatekeeper/services/firebase_auth_methods.dart';
import 'package:college_gatekeeper/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool passUserPassword = true;
  bool passAdminPassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  bool _loading = false;

  Future<void> signUpUser() async {
    if (confirmAdminPassword()) {
      await FirebaseAuthMethods(
              FirebaseAuth.instance, FirebaseFirestore.instance)
          .signUpWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
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
                    "Register",
                    style: TextStyle(
                      color: kDarkBlue,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),

                  //! Name field
                  SizedBox(
                    height: screenHeight / 9.36,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth / 8,
                          screenWidth / 25, screenWidth / 8, screenWidth / 25),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kDarkBlue,
                            ),
                          ),
                          hintText: 'Enter your name',
                          focusColor: kDarkBlue,
                          errorStyle: TextStyle(
                            color: kRed,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Name!';
                          }
                          return null;
                        },
                      ),
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
                            return 'Please Enter Password';
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
                            return 'Please Enter Admin Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 16,
                  ),

                  //! register button
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
                                await signUpUser();
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
                              "Register",
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
                        "Already have an account?",
                        style: TextStyle(
                          color: kDarkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //* moving to login page
                          Navigator.pushReplacementNamed(context, login);
                        },
                        child: const Text(
                          "Login Now",
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
                    height: screenHeight / 60,
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
