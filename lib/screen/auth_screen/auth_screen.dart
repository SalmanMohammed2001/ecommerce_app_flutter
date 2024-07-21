import 'dart:ui';

import 'package:ecommerce_app/screen/auth_screen/widget/CustomTextField.dart';
import 'package:ecommerce_app/screen/home_screen/home_screen.dart';
import 'package:ecommerce_app/utils/custom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/buttons/custom_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/auth_banner.jpg'))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSignUp ? 'Create Account' : "Sign In",
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    isSignUp
                        ? 'signup up with your User Account'
                        : "Connect with Your User account",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(
                    hintText: "Email",
                    iconData: Icons.email,
                  ),
                  const CustomTextField(
                    hintText: "Password",
                    iconData: Icons.password_rounded,
                    isPassword: true,
                  ),
                  isSignUp
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password",
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                  isSignUp
                      ? const CustomTextField(
                          hintText: "confirm Password",
                          iconData: Icons.password_rounded,
                          isPassword: true,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    size: size,
                    text: isSignUp ? "Sign up" : "Sign In",
                    ontap: () {
                      CustomNavigator.push(context, const HomeScreen());
                    },
                  ),
                  CustomButton(
                    size: size,
                    text: isSignUp ? "Sign in" : "Sign Up",
                    bgColor: Colors.white,
                    fontColor: Colors.black,
                    ontap: () {
                      setState(() {
                        isSignUp = !isSignUp;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
