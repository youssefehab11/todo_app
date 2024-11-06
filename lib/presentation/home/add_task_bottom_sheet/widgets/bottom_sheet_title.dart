import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

class TaskLabel extends StatelessWidget {
  final String taskLabel;
  const TaskLabel({super.key, required this.taskLabel});

  @override
  Widget build(BuildContext context) {
    return Text(
      taskLabel,
      textAlign: TextAlign.center,
      style: isLight(context)
          ? LightTextStyles.text18WeightBold
          : DarkTextStyles.text18WeightBold,
    );
  }
}
