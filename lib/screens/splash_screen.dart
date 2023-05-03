import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'register_page.dart';


class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //! double screenWidth = MediaQuery.of(context).size.width;
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
