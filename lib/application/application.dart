import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/theme/theme.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      onGenerateRoute: (settings) => RouteManager.onGenerateRoute(settings),
      initialRoute: context.read<AppAuthProvider>().currentUser == null
          ? Routes.loginRoute
          : Routes.homeRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.currentTheme,
    );
  }
}
