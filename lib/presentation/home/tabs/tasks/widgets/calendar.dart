import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/calendar_bg.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/calendar_list.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDate;
  final Function(DateTime) onDateChange;
  const Calendar({
    super.key,
    required this.focusedDate,
    required this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: Stack(
        children: [
          const CalendarBg(),
          CalendarList(focusedDate: focusedDate, onDateChange: onDateChange)
        ],
      ),
    );
  }
}
