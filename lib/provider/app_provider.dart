import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.dark;
  void changeThemeMode(ThemeMode newTheme){
    if(newTheme != currentTheme){
      currentTheme = newTheme;
      notifyListeners();
    }
  }
}