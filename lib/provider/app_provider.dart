import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_preferences/shared_prefernces.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode currentTheme = AppSharedPreferences.getTheme();
  String currentLanguage = AppSharedPreferences.getLanguage();
  void changeThemeMode(ThemeMode newTheme) {
    if (newTheme != currentTheme) {
      currentTheme = newTheme;
      AppSharedPreferences.saveTheme(newTheme);
      notifyListeners();
    }
  }

  void changeLanguage(String newLanguage) {
    if (currentLanguage != newLanguage) {
      currentLanguage = newLanguage;
      AppSharedPreferences.saveLanguage(newLanguage);
      notifyListeners();
    }
  }
}
