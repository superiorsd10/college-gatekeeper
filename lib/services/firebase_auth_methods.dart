import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/show_snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //! Email sign up
  Future<int> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.toString().trim(),
        password: password,
      );
      return 0;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      //? print(e.email == 'weak_password');
      showSnackBar(context, e.message!);
      return 1;
    }
  }
}
