import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'login_page.dart';
import 'forgot_password.dart';


class MySplashScreen extends StatelessWidget {
  double screenHeight = 1;
  double screenWidth = 1;
  MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      splash: Image.asset(
        'images/splash_image.png',
      ),
      splashIconSize: screenHeight/1.5,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const RegisterPage(),
    );
  }
}
