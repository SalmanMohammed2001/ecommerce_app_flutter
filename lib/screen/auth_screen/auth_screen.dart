import 'dart:ui';

import 'package:ecommerce_app/screen/auth_screen/widget/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'signup up with your User Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    iconData: Icons.email,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    iconData: Icons.password_rounded,
                    isPassword: true,
                  ),
                  CustomTextField(
                    hintText: "confirm Password",
                    iconData: Icons.password_rounded,
                    isPassword: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
