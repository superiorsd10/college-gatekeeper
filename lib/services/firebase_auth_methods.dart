import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/show_snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore; 
  FirebaseAuthMethods(this._auth, this._firestore);

  //! Email sign up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name, 
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.toString().trim(),
        password: password,
      );

      await _firestore.collection('admin').doc(_auth.currentUser?.email).set({
        'name': name, 
      });

    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password); 
    }
    on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
