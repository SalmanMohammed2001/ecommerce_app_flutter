import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/data/demo_data.dart';
import 'package:ecommerce_app/screen/home_screen/widget/categories.dart';
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "The latest",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const Text(
                  "Take a look at what’s new, right now.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),

                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: DemoData.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.99,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 5),
                    itemBuilder: (context, index) => SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Image.network(
                                  DemoData.products[index].image,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      DemoData.products[index].name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '\$ ${DemoData.products[index].price}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
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
