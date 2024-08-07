import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/provider/auth_screen_provider.dart';
import 'package:ecommerce_app/screen/auth_screen/widget/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/buttons/custom_button.dart';
import '../../utils/custom_navigator.dart';
import '../home_screen/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String type = 'signup';


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<AuthScreenProvider>(
          builder: (context,authStatus,child) {
            return Column(
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
                        type == "signup"
                            ? 'Create Account'
                            : type == "signin"
                                ? "Sign In"
                                : "Forgot Password",
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        type == "signup"
                            ? 'signup up with your User Account'
                            : type == "signin"
                                ? "Connect with Your User account"
                                : "Please Enter Your email",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                     type == "signup" ? CustomTextField(
                        hintText: "Name",
                        iconData: Icons.person,
                        controller:authStatus.nameController ,
                      ):const SizedBox(),
                       CustomTextField(
                        hintText: "Email",
                        iconData: Icons.email,
                        controller:authStatus.emailController ,
                      ),
                      type != "forgot"
                          ?  CustomTextField(
                              hintText: "Password",
                              iconData: Icons.password_rounded,
                              isPassword: true,
                        controller: authStatus.passwordController,
                            )
                          : const SizedBox(),
                      type != "signin"
                          ? const SizedBox()
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      type = "forgot";
                                    });
                                    authStatus.clearFields();
                                  },
                                  child: const Text(
                                    "Forgot Password",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                      type == "signup"
                          ?  CustomTextField(
                              hintText: "confirm Password",
                              iconData: Icons.password_rounded,
                              isPassword: true,
                              controller: authStatus.confirmPasswordController,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        size: size,
                        text: type == "signup"
                            ? "Sign up"
                            : type == "signin"
                                ? "Sign In"
                                : "Send Reset Email ",
                        ontap: () {
                          if(type == "signup"){
                            authStatus.startSignUp(context);
                          }else if(type == 'signin'){
                            authStatus.startSignIn(context);
                          }else if(type == "forgot"){
                            authStatus..startSendPasswordResetEmail(context);
                          }

                        },
                      ),
                      CustomButton(
                        size: size,
                        text: type == "signup"
                            ? "Sign In"
                            : type == "signin"
                                ? "Sign Up"
                                : 'Cancel',
                        bgColor: Colors.white,
                        fontColor: Colors.black,
                        ontap: () {

                          authStatus.clearFields();
                          setState(() {
                            if (type == "signin") {
                              type = "signup";
                            } else if(type == "signup") {
                              type = "signin";
                            }else{
                              type = "signup";
                            }
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
