import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';

class SettingsItem extends StatelessWidget {
  final String label;
  final String firstOption;
  final String secondOption;

  const SettingsItem({
    super.key,
    required this.label,
    required this.firstOption,
    required this.secondOption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: LightTextStyles.text18WeightBold,
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownMenu(
            onSelected: (value) {},
            initialSelection: firstOption,
            trailingIcon: const Icon(Icons.keyboard_arrow_down),
            width: MediaQuery.sizeOf(context).width - 20,
            textStyle: LightTextStyles.text16WeightNormal.copyWith(
              color: Theme.of(context).primaryColor,
            ),

            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: firstOption,
                label: firstOption,
                style: const ButtonStyle(
                  textStyle:
                      WidgetStatePropertyAll(LightTextStyles.text16WeightNormal),
                ),
              ),
              DropdownMenuEntry(
                value: secondOption,
                label: secondOption,
                style: const ButtonStyle(
                  textStyle:
                      WidgetStatePropertyAll(LightTextStyles.text16WeightNormal),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
