import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    Key? key,
    required this.pageController,
    required this.index,
  }) : super(key: key);

  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: index,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        expansionFactor: 2.5,
        spacing: 8.0,
        radius: 12.0,
        dotWidth: 18.0,
        dotHeight: 12.0,
        dotColor: Colors.grey,
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
