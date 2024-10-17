import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/presentation/authentication/login/login.dart';
import 'package:todo_app/presentation/authentication/register/register.dart';
import 'package:todo_app/presentation/home/home_screen.dart';

class RouteManager {
  static Route<MaterialPageRoute>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }
      case Routes.loginRoute:
        {
          return MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          );
        }
      case Routes.registerRoute:
        {
          return MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          );
        }
      default:
        {
          return null;
        }
    }
  }
}
