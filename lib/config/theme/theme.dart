import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/core/utils/styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.lightPrimaryColor,
      primary: Colors.white,
      secondary: Colors.black
    ),
    primaryColor: ColorsManager.lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.lightPrimaryColor,
      elevation: 0,
      titleTextStyle: AppTextStyles.appBarStyle,
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
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.iconsGrayColor,
        size: 26,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.lightPrimaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.white,
          width: 4,
        ),
      ),
    ),
  );
}
