import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';
import 'package:shop_app_2022/View/screens/search/search.dart';

import 'customNavigationBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitHome = HomeCubit.get(context);
    cubitHome.getDataUser();
    cubitHome.getDataFavorite();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) async {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is! UserLoginLoadedState &&
                state is! HomeFavoriteLoadedState,
            builder: (context) {
              return Scaffold(
                bottomNavigationBar:
                    CustomBottomNavigationBar(cubitHome: cubitHome),
                appBar: AppBar(
                  title: const Text("Souq"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Search()));
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                body: cubitHome.homeScreen[cubitHome.currentIndex],
              );
            },
            fallback: (context) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            });
      },
    );
  }
}
