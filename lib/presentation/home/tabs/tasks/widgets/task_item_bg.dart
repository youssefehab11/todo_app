import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manager.dart';
import 'package:todo_app/core/utils/constants.dart';

class TaskItemBG extends StatelessWidget {
  const TaskItemBG({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: itemHeight,
            decoration: BoxDecoration(
                color: ColorsManager.redColor,
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Expanded(
          child: Container(
            height: itemHeight,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }
}
