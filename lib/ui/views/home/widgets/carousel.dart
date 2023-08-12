import 'package:dionniebee/ui/common/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: kcPrimaryColor,
        width: 700,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 3 / 0.9,
            viewportFraction: 1,
          ),
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.zero,
                  /*  margin:
                                              const EdgeInsets.symmetric(horizontal: 5.0), */
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/sliders/slide$i.png'),
                        fit: BoxFit.contain),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
