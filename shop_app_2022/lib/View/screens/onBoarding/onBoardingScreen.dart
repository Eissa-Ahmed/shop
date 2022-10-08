import 'package:flutter/material.dart';
import 'package:shop_app_2022/View/screens/user/login.dart';
import 'package:shop_app_2022/constant/shared.dart';
import 'package:shop_app_2022/cubit/shop_cubit.dart';

import 'customFloatingButton.dart';
import 'customPageView.dart';
import 'customSmoothPageIndicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              CachHelper.saveData(key: "onBoarding", value: true);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LogIn()),
              );
            },
            child: Text(
              "SKIP",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (index) {
                    ShopCubit.get(context).changeIndexPageView(index);
                  },
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: ShopCubit.get(context).onBoardingList.length,
                  itemBuilder: (context, i) {
                    return CustomPageView(
                      onBoardingModel: ShopCubit.get(context).onBoardingList[i],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSmoothPageIndicator(
                  pageController: pageController,
                  index: ShopCubit.get(context).onBoardingList.length,
                ),
                CustomFloatingButton(pageController: pageController),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
