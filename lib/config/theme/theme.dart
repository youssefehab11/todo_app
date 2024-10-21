import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/core/utils/styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      primary: ColorsManager.primaryColor,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    primaryColor: ColorsManager.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.primaryColor,
      elevation: 0,
      titleTextStyle: LightTextStyles.appBarStyle,
    ),
    scaffoldBackgroundColor: ColorsManager.lightBackGround,
    primaryColorLight: Colors.white,
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: ColorsManager.primaryColor,
        size: 32,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.iconsGrayColor,
        size: 26,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.white,
          width: 4,
        ),
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        outlineBorder: BorderSide(color: ColorsManager.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.primaryColor),
        ),
        suffixIconColor: ColorsManager.primaryColor,
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsManager.lightBackGround),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      yearForegroundColor: const WidgetStatePropertyAll(Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      primary: ColorsManager.primaryColor,
      onPrimary: ColorsManager.darkBackGround,
      onSurface: Colors.white,
    ),
    primaryColor: ColorsManager.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.primaryColor,
      elevation: 0,
      titleTextStyle: DarkTextStyles.appBarStyle,
    ),
    scaffoldBackgroundColor: ColorsManager.darkBackGround,
    primaryColorLight: ColorsManager.darkColor,
    bottomAppBarTheme: const BottomAppBarTheme(color: ColorsManager.darkColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: ColorsManager.primaryColor,
        size: 32,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.iconsGrayColor,
        size: 26,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: ColorsManager.darkColor,
          width: 4,
        ),
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: ColorsManager.darkColor,
        filled: true,
        outlineBorder: BorderSide(color: ColorsManager.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.primaryColor),
        ),
        suffixIconColor: ColorsManager.primaryColor,
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsManager.darkColor),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorsManager.darkColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      yearForegroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  );
}
