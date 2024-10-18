import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

typedef OnSelected = Function(String?, BuildContext);

class SettingsItem extends StatelessWidget {
  final String label;
  final String firstOption;
  final String secondOption;
  final OnSelected onSelected;
  final String initialSelection;
  const SettingsItem({
    super.key,
    required this.label,
    required this.firstOption,
    required this.secondOption,
    required this.onSelected,
    required this.initialSelection
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
            style: checkCurrentTheme(context)
                ? LightTextStyles.text18WeightBold
                : DarkTextStyles.text18WeightBold,
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownMenu(
            onSelected: (value) => onSelected(value, context),
            initialSelection: initialSelection,
            trailingIcon: const Icon(Icons.keyboard_arrow_down),
            width: MediaQuery.sizeOf(context).width - 20,
            textStyle: LightTextStyles.text16WeightNormal.copyWith(
              color: Theme.of(context).primaryColor,
            ),
            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: firstOption,
                label: firstOption,
                labelWidget: Text(
                  firstOption,
                  style: checkCurrentTheme(context)
                      ? LightTextStyles.text16WeightNormal
                      : DarkTextStyles.text16WeightNormal,
                ),
              ),
              DropdownMenuEntry(
                value: secondOption,
                label: secondOption,
                labelWidget: Text(
                  secondOption,
                  style: checkCurrentTheme(context)
                      ? LightTextStyles.text16WeightNormal
                      : DarkTextStyles.text16WeightNormal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
