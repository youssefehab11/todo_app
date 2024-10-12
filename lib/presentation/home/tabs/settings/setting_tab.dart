import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/tabs/settings/widgets/settings_item.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SettingsItem(
          label: 'Language',
          firstOption: 'English',
          secondOption: 'Arabic',
        ),
        SettingsItem(
          label: 'Mode',
          firstOption: 'Light',
          secondOption: 'Dark',
        )
      ],
    );
  }
}
