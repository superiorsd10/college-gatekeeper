import 'package:college_gatekeeper/screens/home_page.dart';
import 'package:college_gatekeeper/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StatePersistence extends StatefulWidget {
  const StatePersistence({super.key});

  @override
  State<StatePersistence> createState() => _StatePersistenceState();
}

class _StatePersistenceState extends State<StatePersistence> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
