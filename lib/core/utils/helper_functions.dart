import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';

bool isLight(BuildContext context){
  AppProvider provider = Provider.of<AppProvider>(context,listen: false);
  return provider.currentTheme == ThemeMode.light ? true : false;
}

extension FormatDate on DateTime {
   String get getFormatDate => '$day-$month-$year';
}

