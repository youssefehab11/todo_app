import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/application/application.dart';
import 'package:todo_app/core/shared_preferences/shared_prefernces.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/providers/settings_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppAuthProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
