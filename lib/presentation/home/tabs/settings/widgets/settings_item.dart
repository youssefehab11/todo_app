import 'package:flutter/material.dart';

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
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownMenu(
            onSelected: (value) {},
            initialSelection: firstOption,
            trailingIcon: const Icon(Icons.keyboard_arrow_down),
            width: MediaQuery.sizeOf(context).width - 20,
            textStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.normal),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Theme.of(context).primaryColorLight,
              filled: true,
              outlineBorder: BorderSide(color: Theme.of(context).primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              suffixIconColor: Theme.of(context).primaryColor,
            ),
            dropdownMenuEntries:  [
              DropdownMenuEntry(value: firstOption, label: firstOption),
              DropdownMenuEntry(value: secondOption, label: secondOption)
            ],
          )
        ],
      ),
    );
  }
}
