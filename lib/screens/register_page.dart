import 'package:college_gatekeeper/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passUserPassword = true;
  bool passAdminPassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  Future<int> signUpUser() async {
    return FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //! print(screenWidth);
    //! print(screenHeight);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Logo
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth / 4),
                child: Image.asset(
                  'images/splash_image.png',
                  height: screenHeight / 3.3,
                  width: screenWidth / 1.5,
                ),
              ),
              const Text(
                "Register",
                style: TextStyle(
                  color: Color.fromRGBO(0, 95, 153, 1),
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
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(0, 95, 153, 1),
                      )),
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      focusColor: Color.fromRGBO(0, 95, 153, 1),
                    ),
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
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(0, 95, 153, 1),
                      )),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      focusColor: Color.fromRGBO(0, 95, 153, 1),
                    ),
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
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(0, 95, 153, 1),
                      )),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      focusColor: const Color.fromRGBO(0, 95, 153, 1),
                    ),
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
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(0, 95, 153, 1),
                      )),
                      labelText: 'Admin Password',
                      hintText: 'Enter admin password',
                      focusColor: const Color.fromRGBO(0, 95, 153, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 16,
              ),

              //! register button
              SizedBox(
                height: screenHeight / 23.4,
                width: screenWidth / 2.46,
                child: TextButton(
                  onPressed: () async {
                    // print(_emailController?.text);
                    // print(_passwordController?.text);
                    int x = await signUpUser();
                    if (x == 0) {
                      Navigator.pushReplacementNamed(context, home);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 131, 37, 1),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 95, 153, 1),
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
                        color: Color.fromRGBO(0, 95, 153, 1),
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
    );
  }
}
