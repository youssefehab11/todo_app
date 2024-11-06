import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/dialog_utils.dart';
import 'package:todo_app/database/collections/tasks_collection.dart';
import 'package:todo_app/database/models/task_model.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/task_item.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/presentation/home/edit_task_dialog/edit_task_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksList extends StatefulWidget {
  final DateTime selectedDate;
  const TasksList({super.key, required this.selectedDate});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  TasksCollection tasksCollection = TasksCollection();
  List<TaskDM> tasks = [];

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return StreamBuilder<QuerySnapshot<TaskDM>>(
      stream: tasksCollection.getTasksFromFireStore(
          context.read<AppAuthProvider>().authUser!.uid, widget.selectedDate),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Expanded(
            flex: 90,
            child: Center(
              child: Column(
                children: [
                  Text(appLocalizations.somethingWentWrong),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(appLocalizations.tryAgain),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            flex: 90,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.data?.docs != null) {
            tasks = snapshot.data!.docs
                .map(
                  (e) => e.data(),
                )
                .toList();
          }
          return Expanded(
            flex: 90,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  task: tasks[index],
                  onDeleteTaskPressed: onDeleteTaskPressed,
                  onEditTaskPressed: onEditTaskPressed,
                );
              },
            ),
          );
        }
      },
    );
  }

  void onDeleteTaskPressed(TaskDM task) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    showMessageDialog(
      context,
      message: appLocalizations.confirmDeleteTask,
      posActionTitle: appLocalizations.confirm,
      posAction: () {
        deleteTask(task);
      },
      negActionTitle: appLocalizations.cancel,
    );
  }

  void deleteTask(TaskDM task) async {
    TasksCollection tasksCollection = TasksCollection();
    String userId = context.read<AppAuthProvider>().authUser!.uid;
    try {
      showLoadingDialog(context);
      await tasksCollection.deleteTaskFromFireStore(userId, task);
      if (mounted) {
        hideLoadingDialog(context);
      }
    } catch (e) {
      if (mounted) {
        hideLoadingDialog(context);
        showMessageDialog(context,
            message: AppLocalizations.of(context)!.somethingWentWrong,
            posActionTitle: AppLocalizations.of(context)!.ok);
      }
    }
  }

  void onEditTaskPressed(TaskDM task) {
    showEditTaskDialogg(context, task);
  }
}
