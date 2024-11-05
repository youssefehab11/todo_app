import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/utils/validator.dart';
import 'package:todo_app/core/widgets/default_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskInfo extends StatelessWidget {
  final DateTime selectedDate;
  final Function(BuildContext) onDatePressed;
  final TextEditingController taskTitleController;
  final TextEditingController taskDescriptionController;
  const TaskInfo({
    super.key,
    required this.selectedDate,
    required this.onDatePressed,
    required this.taskTitleController,
    required this.taskDescriptionController,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildTaskTitle(context),
        SizedBox(height: size.height * 0.025),
        buildTaskDescription(context),
        SizedBox(height: size.height * 0.025),
        buildSelectDateLabel(context),
        buildDate(context),
      ],
    );
  }

  Widget buildTaskTitle(BuildContext context) {
    return DefaultTextFormField(
      hintText: AppLocalizations.of(context)!.taskTitleHint,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (input) => taskValidator(input, TaskFieldType.title),
      controller: taskTitleController,
    );
  }

  Widget buildTaskDescription(BuildContext context) {
    return DefaultTextFormField(
      hintText: AppLocalizations.of(context)!.taskDescriptionHint,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: (input) => taskValidator(input, TaskFieldType.description),
      controller: taskDescriptionController,
    );
  }

  Widget buildSelectDateLabel(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        AppLocalizations.of(context)!.selectDateLabel,
        style: isLight(context)
            ? LightTextStyles.text20WeightNormal.copyWith(color: Colors.black)
            : DarkTextStyles.text20WeightNormal,
      ),
    );
  }

  Widget buildDate(BuildContext context) {
    return InkWell(
      onTap: () {
        onDatePressed(context);
      },
      child: Text(
        isEnglish(context)
            ? selectedDate.stringFormatDate
            : getArabicNumbers(selectedDate.stringFormatDate),
        textAlign: TextAlign.center,
        style: isLight(context)
            ? LightTextStyles.text18WeightNormalInter
            : DarkTextStyles.text18WeightNormalInter,
      ),
    );
  }
}
