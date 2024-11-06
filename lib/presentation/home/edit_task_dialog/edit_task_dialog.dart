import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/dialog_utils.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/database/collections/tasks_collection.dart';
import 'package:todo_app/database/models/task_model.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/widgets/bottom_sheet_title.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/widgets/task_info.dart';
import 'package:todo_app/providers/auth_provider.dart';

class EditTaskDialog extends StatefulWidget {
  final TaskDM task;
  const EditTaskDialog({
    super.key,
    required this.task,
  });

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController taskTitleController;
  late TextEditingController taskDescriptionController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();
    taskTitleController = TextEditingController();
    taskDescriptionController = TextEditingController();
    taskTitleController.text = widget.task.title!;
    taskDescriptionController.text = widget.task.description!;
    selectedDate = widget.task.dateTime!;
  }

  @override
  void dispose() {
    super.dispose();
    taskTitleController.dispose();
    taskDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Size size = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: SizedBox(
        height: size.height * 0.5,
        width: size.width * 1.7,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TaskLabel(
                  taskLabel: appLocalizations.editTaskLabel,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TaskInfo(
                  selectedDate: selectedDate,
                  onDatePressed: (context) => showDatePickerCalendar(),
                  taskTitleController: taskTitleController,
                  taskDescriptionController: taskDescriptionController,
                ),
                SizedBox(height: size.height * 0.05),
                DefaultButton(
                  btnText: appLocalizations.saveChanges,
                  onPressed: () {
                    onSaveChangesPressed(widget.task);
                  },
                ),
                SizedBox(height: size.height * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSaveChangesPressed(TaskDM task) {
    if (formKey.currentState?.validate() == false) return;
    if (task.title != taskTitleController.text ||
        task.description != taskDescriptionController.text ||
        task.dateTime != selectedDate) {
      editTask(task);
    } else {
      Navigator.of(context).pop();
    }
  }

  void editTask(TaskDM task) async {
    TasksCollection tasksCollection = TasksCollection();
    String userId = context.read<AppAuthProvider>().authUser!.uid;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    try {
      showLoadingDialog(context);
      task.title = taskTitleController.text;
      task.description = taskDescriptionController.text;
      task.dateTime = selectedDate;
      await tasksCollection.editTaskInFireStore(userId, task);
      if (mounted) {
        hideLoadingDialog(context);
        showMessageDialog(
          context,
          message: appLocalizations.taskEditedSuccessfully,
          posActionTitle: appLocalizations.ok,
          posAction: () {
            Navigator.of(context).pop();
          },
        );
      }
    } catch (e) {
      if (mounted) {
        hideLoadingDialog(context);
        showMessageDialog(
          context,
          message: appLocalizations.somethingWentWrong,
          posActionTitle: appLocalizations.tryAgain,
        );
      }
    }
  }

  void showDatePickerCalendar() async {
    DateTime pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
          initialDate: DateTime.now(),
        ) ??
        selectedDate;
    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}

void showEditTaskDialogg(BuildContext context, TaskDM task) {
  showDialog(
    context: context,
    builder: (context) {
      return EditTaskDialog(
        task: task,
      );
    },
  );
}
