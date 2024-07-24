
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(50)),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            const Text(
              "Apple Store",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
           IconButton(onPressed: () {
             AuthController.signOutAccount();

           }, icon: const Icon(Icons.exit_to_app,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
