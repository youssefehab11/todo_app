import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/slidable_item.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/task_item_bg.dart';

class TaskItem extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  const TaskItem(
      {super.key, required this.taskTitle, required this.taskDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const TaskItemBG(),
          SlidableItem(
            taskTitle: taskTitle,
            taskDescription: taskDescription,
          )
        ],
      ),
    );
  }
}
