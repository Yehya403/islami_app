import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryDark = Color(0xff141A2E);
  static const Color secondaryDark = Color(0x80facc1d);
  static const Color primaryLight = Color(0xffB7935F);
  static ThemeData lightMode = ThemeData(
    cardTheme:const CardTheme(
        surfaceTintColor: Colors.transparent
        ,color: Colors.white
    ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 26)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedItemColor: Colors.white,
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffB7935F),
          primary: const Color(0xffB7935F),
          secondary: const Color(0x80b7935f),
          onPrimary: Colors.white,
          onSecondary: Colors.black
        ,background: Colors.white,
      ),
    dividerColor: primaryLight,

    useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
        titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400,color: Colors.black),
        titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.black)),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
  );
  static ThemeData darkMode = ThemeData(
    cardTheme:const CardTheme(
        surfaceTintColor: Colors.transparent
        ,color: primaryDark
    ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 26)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: secondaryDark,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedItemColor: Colors.white,
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: primaryDark,
          primary: primaryDark,
          secondary: secondaryDark,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          background: primaryDark,
      ),
    dividerColor: primaryLight,
    useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
        titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400,color: Colors.white),
        titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white),
  ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: primaryDark,
    ),
  );
}
