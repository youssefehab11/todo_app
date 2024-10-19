import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_preferences/shared_prefernces.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode currentTheme = AppSharedPreferences.getTheme();
  void changeThemeMode(ThemeMode newTheme){
    if(newTheme != currentTheme){
      currentTheme = newTheme;
      AppSharedPreferences.saveTheme(newTheme);
      notifyListeners();
    }
  }
}