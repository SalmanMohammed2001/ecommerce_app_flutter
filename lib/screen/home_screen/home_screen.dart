import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/data/demo_data.dart';
import 'package:ecommerce_app/screen/home_screen/widget/custom_app_bar.dart';
import 'package:ecommerce_app/screen/home_screen/widget/news_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 8,
              ),
              NewsSlider(size: size),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Apple Store",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const Text(
                "The best way to buy the products you love.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      DemoData.categories.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SizedBox(
                                width: 120,
                                height: 120,
                                child: Stack(
                                  children: [
                                    Align(
                                     alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 120,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade700,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                    Align(
                                      //alignment: Alignment.topCenter,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                              DemoData.categories[index].image),
                                          Text(DemoData.categories[index].name,style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
