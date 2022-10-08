import 'package:flutter/material.dart';

import '../../../constant/shared.dart';
import '../../../cubit/shop_cubit.dart';
import '../user/login.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (ShopCubit.get(context).islast) {
          CachHelper.saveData(key: "onBoarding", value: true);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => LogIn()),
          );
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }
      },
      child: const Icon(Icons.arrow_forward_ios),
    );
  }
}
