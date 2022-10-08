import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../View/screens/onBoarding/modelOnBoarding.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        img: "assets/img/onboarding1.png",
        title: "Title 1",
        des: "Descriptioan 1"),
    OnBoardingModel(
        img: "assets/img/onboarding2.png",
        title: "Title 2",
        des: "Descriptioan 2"),
    OnBoardingModel(
        img: "assets/img/onboarding3.png",
        title: "Title 3",
        des: "Descriptioan 3"),
  ];
  bool islast = false;
  changeIndexPageView(int index) {
    if (index == onBoardingList.length - 1) {
      islast = true;
    } else {
      islast = false;
    }
    emit(ChangeIndexPageView());
  }
}
