
import 'dart:async';

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



  void startSignUp(){
  //  EasyLoading.show(status: 'loading');

    Timer(Duration(seconds: 3),() => EasyLoading.dismiss());

  }



}