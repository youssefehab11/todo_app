import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    return prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode newTheme) async {
    await prefs.setString('theme', newTheme.name);
  }

  static ThemeMode getTheme() {
    final String? theme = prefs.getString('theme');
    return theme == 'light' || theme == null ? ThemeMode.light : ThemeMode.dark;
  }

  static void saveLanguage(String newLanguage) async {
    await prefs.setString('language', newLanguage);
  }

  static String getLanguage() {
    return prefs.getString('language') ?? 'en';
  }
}
