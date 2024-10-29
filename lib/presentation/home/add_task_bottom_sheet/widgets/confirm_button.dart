import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/model/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      FirebaseFirestore db = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> collectionReference =
          db.collection(TaskDM.collectionName);
      DocumentReference<Map<String, dynamic>> documentReference =
          collectionReference.doc();
      TaskDM newTask = TaskDM(
        id: documentReference.id,
        title: taskTitleController.text,
        description: taskDescriptionController.text,
        dateTime: datePickerSelectedDate,
        state: false,
      );
      documentReference.set(newTask.toJson()).timeout(
        const Duration(milliseconds: 500),
        onTimeout: () {
          if (context.mounted) Navigator.pop(context);
        },
      );
    }
  }
}
