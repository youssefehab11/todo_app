import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

bool isLight(BuildContext context) {
  return context.read<AppProvider>().currentTheme == ThemeMode.light
      ? true
      : false;
}

bool isEnglish(BuildContext context) {
  return context.read<AppProvider>().currentLanguage == 'en' ? true : false;
}

extension FormatDate on DateTime {
  String get getFormatDate => '$day - $month - $year';
  String getDayName(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    switch (weekday) {
      case DateTime.saturday:
        return appLocalizations.saturday;
      case DateTime.sunday:
        return appLocalizations.sunday;
      case DateTime.monday:
        return appLocalizations.monday;
      case DateTime.tuesday:
        return appLocalizations.tuesday;
      case DateTime.wednesday:
        return appLocalizations.wednesday;
      case DateTime.thursday:
        return appLocalizations.thursday;
      case DateTime.friday:
        return appLocalizations.friday;
      default:
        return '';
    }
  }
}

String getArabicNumbers(String number) {
  return number.split('').map(
    (char) {
      return arabicNumbers[char] ?? char;
    },
  ).join();
}
