import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/views/auth/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'buildin_transformers.dart';

class OnboaringItem {
  final String testimonial;
  final String personName;
  final String personTitle;
  final Color color;
  final String image;
  OnboaringItem(
      {required this.testimonial,
      required this.personName,
      required this.personTitle,
      required this.color,
      required this.image});
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final list = [
    OnboaringItem(
        testimonial:
            "The convenience of ordering my favorite cappuccino and having it ready when I arrive is a game-changer. This app is a lifesaver!",
        color: Colors.orange,
        image: 'assets/login_bg.jpg',
        personName: "John Smith",
        personTitle: "CEO"),
    OnboaringItem(
      testimonial:
          "The CoffeeCo app has revolutionized my coffee routine! As a barista myself, I appreciate how easy it is to explore their diverse coffee menu and place orders.",
      color: Colors.red,
      image: 'assets/register_bg.jpg',
      personName: "Emily Johnson",
      personTitle: "Barista",
    ),
    OnboaringItem(
      testimonial:
          "I've tried many coffee apps, but CoffeeCo stands out with its user-friendly interface and lightning-fast order processing.",
      color: Colors.green,
      image: 'assets/login_bg.jpg',
      personName: "Mark Dionnie",
      personTitle: "App Developer",
    )
  ];

  final controller = TransformerPageController(
    initialPage: 0,
    itemCount: 3,
    loop: true,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TransformerPageView(
          itemCount: list.length,
          pageController: controller,
          loop: true,
          viewportFraction: 0.8,
          transformer: ScaleAndFadeTransformer(),
          itemBuilder: (BuildContext context, int index) {
            final item = list[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Container(
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0, 0.8],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              /*     colorFilter: ColorFilter.mode(
                                item.color.withOpacity(0.4),
                                BlendMode.srcOver,
                              ), */
                              image: AssetImage(item.image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 80),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 800,
                                    child: Text(
                                      "\"${item.testimonial}.\"",
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                      ).copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  vSpaceRegular,
                                  Text(
                                    item.personName,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ).copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.personTitle,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ).copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: const Logo(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: list.length,
                  effect: const WormEffect(
                    activeDotColor: Colors.white,
                    dotWidth: 10,
                    dotHeight: 10,
                  ), // your preferred effect
                  onDotClicked: (index) {})),
        )
      ],
    );
  }
}
