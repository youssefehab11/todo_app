import 'package:flutter/material.dart';
import 'package:todo_app/database/models/task_model.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/slidable_item.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/task_item_bg.dart';

class TaskItem extends StatelessWidget {
  final TaskDM task;
  final OnSlidableActionTaskPressed onDeleteTaskPressed;
  final OnSlidableActionTaskPressed onEditTaskPressed;
  const TaskItem({
    super.key,
    required this.task,
    required this.onDeleteTaskPressed,
    required this.onEditTaskPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const TaskItemBG(),
          SlidableItem(
            task: task,
            onDeleteTaskPressed: onDeleteTaskPressed,
            onEditTaskPressed: onEditTaskPressed,
          )
        ],
      ),
    );
  }
}
