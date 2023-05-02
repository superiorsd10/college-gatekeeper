import 'package:college_gatekeeper/utilities/forgot_password.dart';
import 'package:flutter/material.dart';
import 'utilities/home_page.dart';
import 'utilities/splash_screen.dart';
import 'utilities/register_page.dart';
import 'utilities/login_page.dart';
import 'utilities/home_page.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Gatekeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
      routes: {
        '/register' : (context) => const RegisterPage(),
        '/login' : (context) => const LoginPage(),
        '/home' : (context) => const HomePage(),
        '/forgotPassword' : (context) => const ForgotPassword(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   double screenHeight = 1;
//   double screenWidth = 1;

//   @override
//   Widget build(BuildContext context) {
    
// }

