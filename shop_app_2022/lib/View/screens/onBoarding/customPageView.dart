import 'package:flutter/material.dart';

import 'modelOnBoarding.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({
    Key? key,
    required this.onBoardingModel,
  }) : super(key: key);

  OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(
          flex: 1,
        ),
        Image.asset(
          onBoardingModel.img,
          width: double.infinity,
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          onBoardingModel.title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          onBoardingModel.des,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
