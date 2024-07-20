import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.iconData,
    required this.hintText,
    this.isPassword = false,
    this.controller,
  });

  final IconData iconData;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: widget.controller,
        obscureText: isObscure,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword? IconButton(
              onPressed: () {
                setState(() {
                  isObscure=!isObscure;
                });
              },
              icon:  Icon(
                isObscure ? Icons.visibility:Icons.visibility_off,
                color: Colors.white,
              ),
            ):null,
            prefixIcon: Icon(
              widget.iconData,
              color: Colors.white60,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            fillColor: Colors.grey.shade600,
            filled: true),
      ),
    );
  }
}
