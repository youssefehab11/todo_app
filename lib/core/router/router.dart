import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/presentation/home/home_screen.dart';

class RouteManager {
  static Route<MaterialPageRoute>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.homeRoute: {
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      }
      default: {
        return null;
      }
    }
  }
}