import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manager.dart';

class CalendarBg extends StatelessWidget {
  const CalendarBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: ColorsManager.primaryColor,
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        )
      ],
    );
  }
}
