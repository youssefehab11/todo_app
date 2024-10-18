import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/theme/theme.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/provider/app_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      onGenerateRoute: (settings) => RouteManager.onGenerateRoute(settings),
      initialRoute: Routes.homeRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.currentTheme,
    );
  }
}