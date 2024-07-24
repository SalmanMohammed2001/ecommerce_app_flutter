
import 'package:flutter/material.dart';

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

}