import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/calendar.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Calendar(),
        TaskItem()
      ],
    );
  }
}
