import 'package:college_gatekeeper/services/state_persistance.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      splash: Image.asset(
        'images/splash_image.png',
      ),
      splashIconSize: screenHeight/1.5,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const StatePersistence(),
    );
  }
}
