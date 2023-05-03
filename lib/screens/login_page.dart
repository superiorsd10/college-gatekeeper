import 'package:flutter/material.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passUserPassword = true;
  bool passAdminPassword = true;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _adminPasswordController;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //!  print(screenWidth);
    //!  print(screenHeight);
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
                "Login",
                style: TextStyle(
                  color: Color.fromRGBO(0, 95, 153, 1),
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
                height: screenHeight / 70,
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
                      color: Color.fromRGBO(0, 95, 153, 1),
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
                height: screenHeight / 23.4,
                width: screenWidth / 2.46,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, home);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 131, 37, 1),
                  ),
                  child: const Text(
                    "Login",
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
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 95, 153, 1),
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
                height: screenHeight / 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
