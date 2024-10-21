import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/presentation/home/tabs/settings/widgets/settings_item.dart';
import 'package:todo_app/provider/app_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsItem(
          label: 'Language',
          firstOption: 'English',
          secondOption: 'Arabic',
          initialSelection: 'English',
          onSelected: (value, context) {

          } ,
        ),
        SettingsItem(
          label: 'Mode',
          firstOption: 'Light',
          secondOption: 'Dark',
          initialSelection: isLight(context) ? 'Light' : 'Dark',
          onSelected: changeTheme,
        )
      ],
    );
  }
  void changeTheme(String? value, BuildContext context){
    AppProvider provider = Provider.of<AppProvider>(context, listen: false);
    if(value == 'Light'){
      provider.changeThemeMode(ThemeMode.light);
    }
    else{
      provider.changeThemeMode(ThemeMode.dark);
    }
  }
}
