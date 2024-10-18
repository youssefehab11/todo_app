import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/application/application.dart';
import 'package:todo_app/provider/app_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}
