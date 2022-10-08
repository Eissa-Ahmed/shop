import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

const Color primaryColor = Color(0xff4D0179);
var primarySwatchLight = const MaterialColor(0xff4D0179, {
  50: Color(0xff4D0179),
  100: Color(0xff4D0179),
  200: Color(0xff4D0179),
  300: Color(0xff4D0179),
  400: Color(0xff4D0179),
  500: Color(0xff4D0179),
  600: Color(0xff4D0179),
  700: Color(0xff4D0179),
  800: Color(0xff4D0179),
  900: Color(0xff4D0179),
});
var primarySwatchDark = const MaterialColor(0xff7402B6, {
  50: Color(0xff7402B6),
  100: Color(0xff7402B6),
  200: Color(0xff7402B6),
  300: Color(0xff7402B6),
  400: Color(0xff7402B6),
  500: Color(0xff7402B6),
  600: Color(0xff7402B6),
  700: Color(0xff7402B6),
  800: Color(0xff7402B6),
  900: Color(0xff7402B6),
});
const Color primaryColorLight = Color(0xff7402B6);
const Color primaryColordark = Color(0xff11001C);
ThemeData lightTheme() {
  return ThemeData(
    primarySwatch: primarySwatchLight,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 26,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 26,
      ),
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // iconColor: const Color.fromARGB(255, 175, 175, 175),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 175, 175, 175),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 175, 175, 175),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 10.0,
      focusElevation: 25.0,
    ),
    fontFamily: "Muli",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 161, 161, 161),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 10.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColordark,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primarySwatch: primarySwatchDark,
    primaryColor: primaryColorLight,
    scaffoldBackgroundColor: HexColor("#11001C"),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColordark,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: primaryColordark,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 26,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 26,
      ),
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: const Color.fromARGB(255, 223, 223, 223),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 223, 223, 223),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryColorLight,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 223, 223, 223),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColorLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColorLight,
      elevation: 10.0,
      focusElevation: 25.0,
    ),
    fontFamily: "Muli",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primaryColorLight,
      ),
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 190, 190, 190),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColordark,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    ),
  );
}
