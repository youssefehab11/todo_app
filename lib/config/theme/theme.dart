import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/core/utils/fonts_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.lightPrimaryColor, primary: Colors.white),
      primaryColor: ColorsManager.lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.lightPrimaryColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: FontsManager.poppins,
        ),
      ),
      scaffoldBackgroundColor: ColorsManager.lightBackGround,
      primaryColorLight: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: ColorsManager.lightPrimaryColor,
            size: 32,
          ),
          unselectedIconTheme:
              IconThemeData(color: ColorsManager.grayColor, size: 26)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.lightPrimaryColor,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white, width: 4),
        ),
      ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: ColorsManager.lightPrimaryColor),
        titleSmall: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsManager.lightPrimaryColor,
            fontFamily: 'Poppins'),
        displaySmall: TextStyle(fontSize: 12, color: Colors.black),
        displayMedium: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'),
      ));
}
