import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/model/task_model.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final List<TaskDM> tasks;
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 85,
      child: ListView.builder(
        itemBuilder: (context, index) => TaskItem(
          taskTitle: tasks[index].title,
          taskDescription: tasks[index].description,
        ),
        itemCount: tasks.length,
      ),
    );
  }
}
