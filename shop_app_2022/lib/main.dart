import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';
import 'package:shop_app_2022/View/screens/home/home.dart';
import 'package:shop_app_2022/View/screens/onBoarding/onBoardingScreen.dart';
import 'package:shop_app_2022/View/screens/user/cubit/user_cubit.dart';
import 'package:shop_app_2022/View/screens/user/login.dart';
import 'package:shop_app_2022/constant/dio.dart';
import 'package:shop_app_2022/constant/shared.dart';
import 'package:shop_app_2022/cubit/shop_cubit.dart';
import 'package:shop_app_2022/track.dart';

import 'constant/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Widget startWidget;
  if (CachHelper.sharedPreferences.get("onBoarding") != null) {
    if (CachHelper.sharedPreferences.get("token") != null) {
      startWidget = Home();
    } else {
      startWidget = LogIn();
    }
  } else {
    startWidget = OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.startWidget}) : super(key: key);
  Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => HomeCubit()..getDataHome()..getDataCategory()..getDataFavorite()..getDataUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
