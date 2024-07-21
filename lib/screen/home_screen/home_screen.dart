import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/data/demo_data.dart';
import 'package:ecommerce_app/screen/home_screen/widget/categories.dart';
import 'package:ecommerce_app/screen/home_screen/widget/custom_app_bar.dart';
import 'package:ecommerce_app/screen/home_screen/widget/news_slider.dart';
import 'package:ecommerce_app/screen/home_screen/widget/product_grid.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(
                  height: 8,
                ),
                NewsSlider(size: size),
                const Categories(),
                const ProductGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
* Card(
                            color: Colors.white,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            shadowColor: Colors.grey,
                            elevation: 8,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      DemoData.products[index].image,
                                      width: size.width * 0.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      DemoData.products[index].name,
                                      style:
                                          const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                 Align(
                                   alignment: Alignment.bottomCenter,
                                   child: Text('\$ ${DemoData.products[index].price}',
                                      style:
                                      const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                 ),
                                ],
                              ),
                            ),
                          ),
* */
