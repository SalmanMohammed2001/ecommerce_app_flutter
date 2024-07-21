

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/demo_data.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(autoPlay: true,aspectRatio: 16/7 ),
      items: DemoData.sliderImages.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: size.width,
                //height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover)
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
