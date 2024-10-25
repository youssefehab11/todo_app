import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Add new Task',
      textAlign: TextAlign.center,
      style: isLight(context)
          ? LightTextStyles.text18WeightBold
          : DarkTextStyles.text18WeightBold,
    );
  }
}