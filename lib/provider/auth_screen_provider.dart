
import 'dart:async';

import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthScreenProvider extends ChangeNotifier{
  TextEditingController  _emailController =  TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

    // TextEditingController emailController(){
    //   return _emailController;
    // }

  TextEditingController get  emailController => _emailController;
  TextEditingController get  passwordController => _passwordController;
  TextEditingController get  confirmPasswordController => _confirmPasswordController;



  void startSignUp(BuildContext context){
    if(_emailController.text.trim().isEmpty){
       CustomDialog.showDialog(context,title:"something went wrong" ,content: "please insert your email");
    }else if(_passwordController.text.trim().length < 6){
      CustomDialog.showDialog(context,title:"something went wrong" ,content: "password must be  6 characters");

    }else if(_passwordController.text != _confirmPasswordController.text){
      CustomDialog.showDialog(context,title:"something went wrong" ,content: "password Not Match");

    }else {
      CustomDialog.showLoader();
      AuthController.createUserAccount(_emailController.text, _passwordController.text,context);
    }

  }

  void startSignIn(BuildContext context){
    if(_emailController.text.trim().isEmpty){
      CustomDialog.showDialog(context,title:"something went wrong" ,content: "please insert your email");
    }else if(_passwordController.text.trim().length < 6){
      CustomDialog.showDialog(context,title:"something went wrong" ,content: "password must be  6 characters");
    }else {
      CustomDialog.showLoader();
      AuthController.signInUser(_emailController.text, _passwordController.text,context);
    }

  }

  void clearFields(){
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    notifyListeners();
  }

  void startSendPasswordResetEmail(BuildContext context){
    if(_emailController.text.trim().length<= 4){
      CustomDialog.showDialog(context,title:"something went wrong" ,content: "please insert your email");
    }else{
      CustomDialog.showLoader();
      AuthController.sendPasswordResetEmail(context, _emailController.text);
    }


  }



}