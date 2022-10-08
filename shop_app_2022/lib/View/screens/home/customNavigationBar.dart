import 'package:flutter/material.dart';

import 'cubit/home_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.cubitHome,
  }) : super(key: key);

  final HomeCubit cubitHome;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      currentIndex: cubitHome.currentIndex,
      onTap: (index) {
        cubitHome.changeIndex(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Category"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
