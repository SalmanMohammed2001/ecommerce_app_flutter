import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthController {
  static Future<void> createUserAccount(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().f('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().f('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInUser(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().f('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().f('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> signOutAccount() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Logger().f(e);
    }
  }
}
