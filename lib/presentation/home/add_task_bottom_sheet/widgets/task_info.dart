import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/widgets/default_text_form_field.dart';

class TaskInfo extends StatelessWidget {
  final DateTime selectedDate;
  final Function(BuildContext) onDatePressed;
  const TaskInfo({
    super.key,
    required this.selectedDate,
    required this.onDatePressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildTaskTitle(),
        SizedBox(height: size.height * 0.025),
        buildTaskDescription(),
        SizedBox(height: size.height * 0.025),
        buildSelectTimeLabel(context),
        buildTime(context),
      ],
    );
  }

  Widget buildTaskTitle() {
    return DefaultTextFormField(
      hintText: 'enter your task title',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildTaskDescription() {
    return DefaultTextFormField(
      hintText: 'enter your task details',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: (input) {
        return null;
      },
    );
  }

  buildSelectTimeLabel(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Select time',
        style: isLight(context)
            ? LightTextStyles.text20WeightNormal.copyWith(color: Colors.black)
            : DarkTextStyles.text20WeightNormal,
      ),
    );
  }

  Widget buildTime(BuildContext context) {
    return InkWell(
      onTap: () {
        onDatePressed(context);
      },
      child: Text(
        selectedDate.getFormatDate,
        textAlign: TextAlign.center,
        style: isLight(context)
            ? LightTextStyles.text18WeightNormal
            : DarkTextStyles.text18WeightNormal,
      ),
    );
  }
}
