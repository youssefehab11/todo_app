import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/application/application.dart';
import 'package:todo_app/core/shared_preferences/shared_prefernces.dart';
import 'package:todo_app/provider/app_provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}
