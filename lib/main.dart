import 'package:college_gatekeeper/screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart';
import 'screens/register_page.dart';
import 'screens/login_page.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const MySplashScreen(),
      routes: {
        register : (context) => const RegisterPage(),
        login : (context) => const LoginPage(),
        home : (context) => const HomePage(),
        forgotPassword : (context) => const ForgotPassword(),
      },
    );
  }
}


