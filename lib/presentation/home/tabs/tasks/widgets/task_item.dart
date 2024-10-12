import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/slidable_item.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/task_item_bg.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TaskItemBG(),
          SlidableItem()
        ],
      ),
    );
  }
}
