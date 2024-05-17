import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FbAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createAccount(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      unawaited(userCredential.user!.sendEmailVerification());
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (exception) {
      _controlFirebaseAuthException(exception, context);
    } catch (e) {}
    return false;
  }

  Future<bool> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        return true;
      }
    } on FirebaseAuthException catch (exception) {
      _controlFirebaseAuthException(exception, context);
    } catch (e) {}
    return false;
  }

  void _controlFirebaseAuthException(
      FirebaseAuthException exception, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(exception.message ?? '')));
    if (exception.code == 'email-already-in-use') {
    } else if (exception.code == 'invalid-email') {
    } else if (exception.code == 'operation-not-allowed') {
    } else if (exception.code == 'invalid-email') {
    } else if (exception.code == 'user-not-found') {
    } else if (exception.code == 'wrong-password') {
    } else if (exception.code == 'user-disabled') {}
  }
}
