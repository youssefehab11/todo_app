import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/presentation/home/tabs/settings/widgets/settings_item.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        SettingsItem(
          label: appLocalizations.languageLabel,
          firstOption: appLocalizations.englishOption,
          secondOption: appLocalizations.arabicOption,
          initialSelection: isEnglish(context)
              ? appLocalizations.englishOption
              : appLocalizations.arabicOption,
          onSelected: changeLanguage,
        ),
        SettingsItem(
          label: appLocalizations.modeLabel,
          firstOption: appLocalizations.lightOption,
          secondOption: appLocalizations.darkOption,
          initialSelection: isLight(context)
              ? appLocalizations.lightOption
              : appLocalizations.darkOption,
          onSelected: changeTheme,
        )
      ],
    );
  }

  void changeTheme(String? value, BuildContext context) {
    if (value == 'Light' || value == 'فاتح') {
      context.read<SettingsProvider>().changeThemeMode(ThemeMode.light);
    } else {
      context.read<SettingsProvider>().changeThemeMode(ThemeMode.dark);
    }
  }

  void changeLanguage(String? value, BuildContext context) {
    if (value == 'English') {
      context.read<SettingsProvider>().changeLanguage('en');
    } else {
      context.read<SettingsProvider>().changeLanguage('ar');
    }
  }
}
