import 'package:flutter/material.dart';
import 'utilities/image_capture.dart';
import 'utilities/splash_screen.dart';
import 'utilities/register_page.dart';
import 'utilities/login_page.dart';
import 'utilities/image_capture.dart';

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
        '/image' : (context) => const ImageCapture(),
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

