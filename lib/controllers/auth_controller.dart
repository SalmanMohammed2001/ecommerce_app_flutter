import 'dart:async';

import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/models/UserModel.dart';
import 'package:ecommerce_app/provider/auth_screen_provider.dart';
import 'package:ecommerce_app/utils/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AuthController {
  static Future<void> createUserAccount(
      String emailAddress, String password, String name,BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .then((value) async{
            UserModel user= UserModel(name: name, email: value.user!.email!, uid: value.user!.uid);
         await   UserController().saveUserData(user, context);
      });
    } on FirebaseAuthException catch (e) {
      CustomDialog.dismissLoader();
      if (e.code == 'invalid-email') {
        CustomDialog.showDialog(context,
            title: 'Something went wring', content: 'invalid email Address');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.showDialog(context,
            title: 'Something went wring', content: 'Email Already user');
      }
    } catch (e) {
      CustomDialog.dismissLoader();
      CustomDialog.showDialog(context,
          title: 'Something went wring', content: e.toString());
    }
  }

  static Future<void> signInUser(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => CustomDialog.dismissLoader());
    } on FirebaseAuthException catch (e) {
      CustomDialog.dismissLoader();
      if (e.code == 'user-not-found') {
        CustomDialog.showDialog(context,
            title: 'Something went wring', content: 'Not user this email');
      } else if (e.code == 'wrong-password') {
        CustomDialog.showDialog(context,
            title: 'Something went wring', content: 'Password invalid');
      } else if (e.code == 'invalid-email') {
        CustomDialog.showDialog(context,
            title: 'Something went wring', content: 'invalid email Address');
      }
    } catch (e) {
      CustomDialog.dismissLoader();
      CustomDialog.showDialog(context,
          title: 'Something went wring', content: e.toString());
    }
  }

  static Future<void> signOutAccount(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut().then(
          (value) => Provider.of<AuthScreenProvider>(context,listen: false).clearFields());
    } catch (e) {
      Logger().f(e);
    }
  }

  static Future<void> sendPasswordResetEmail(BuildContext context,String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email);
      Provider.of<AuthScreenProvider>(context,listen: false).clearFields();
      CustomDialog.showDialog(context,
          title: 'Success', content: "please check your email");
      CustomDialog.dismissLoader();

    } catch (e) {
      CustomDialog.dismissLoader();
      CustomDialog.showDialog(context,
          title: 'Something went wring', content: e.toString());

    }
  }
}
