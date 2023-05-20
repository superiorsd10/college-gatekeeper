import 'package:college_gatekeeper/screens/forgot_password.dart';
import 'package:college_gatekeeper/services/state_persistance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart';
import 'screens/register_page.dart';
import 'screens/login_page.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/about_team.dart';
import 'screens/profile_page.dart';
import 'screens/student_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kWhite, // navigation bar color
    statusBarColor: kWhite, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
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
        primarySwatch: kBlue, 
      ),
      home: const MySplashScreen(),
      routes: {
        register: (context) => const RegisterPage(),
        login: (context) => const LoginPage(),
        home: (context) => const HomePage(),
        forgotPassword: (context) => const ForgotPassword(),
        aboutTeam: (context) => const AboutPage(),
        profile : (context) => const ProfilePage(),
        dateList : (context) => const DateList(),
        studentList : (context) => const StudentList(),
        statePersistence: (context) => const StatePersistence(),
      },
    );
  }
}
