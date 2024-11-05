import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/dialog_utils.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/database/collections/tasks_collection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/providers/auth_provider.dart';

class ConfirmButton extends StatelessWidget {
  final TextEditingController taskTitleController;
  final TextEditingController taskDescriptionController;
  final DateTime datePickerSelectedDate;
  final GlobalKey<FormState> formKey;
  const ConfirmButton({
    super.key,
    required this.taskTitleController,
    required this.taskDescriptionController,
    required this.datePickerSelectedDate,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      btnText: AppLocalizations.of(context)!.done,
      onPressed: () => onDonePressed(context),
    );
  }

  void onDonePressed(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      addNewTask(context);
    }
  }

  void addNewTask(BuildContext context) async {
    String userId = context.read<AppAuthProvider>().getUserId()!;
    TasksCollection tasksCollection = TasksCollection();
    try {
      showLoadingDialog(context);
      await tasksCollection.saveTasksToFireStore(
        userId: userId,
        title: taskTitleController.text,
        description: taskDescriptionController.text,
        date: datePickerSelectedDate,
      );
      if (context.mounted) {
        hideLoadingDialog(context);
        Navigator.pop(context);
      }
    } catch (e) {
      String message = 'Something went wrong: ${e.toString()}';
      print(e.toString());
      if (context.mounted) {
        hideLoadingDialog(context);
        showMessageDialog(
          context,
          message: message,
          posActionTitle: 'Try Again',
        );
      }
    }
  }
}
