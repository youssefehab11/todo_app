import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/default_text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: MediaQuery.viewInsetsOf(context),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              buildTitle(),
              SizedBox(
                height: size.height * 0.025,
              ),
              buildTaskTitle(),
              SizedBox(
                height: size.height * 0.025,
              ),
              buildTaskDescription(),
              SizedBox(
                height: size.height * 0.025,
              ),
              buildSelectTimeLabel(),
              buildTime(),
              SizedBox(
                height: size.height * 0.02,
              ),
              DefaultButton(btnText: 'Done', onPressed: () {}),
              SizedBox(
                height: size.height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDatePickerCalendar(BuildContext context) async {
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

  Widget buildTitle() {
    return Text(
      'Add new Task',
      textAlign: TextAlign.center,
      style: isLight(context)
          ? LightTextStyles.text18WeightBold
          : DarkTextStyles.text18WeightBold,
    );
  }

  Widget buildTaskTitle() {
    return DefaultTextFormField(
      hintText: 'enter your task title',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (input) {},
    );
  }

  Widget buildTaskDescription() {
    return DefaultTextFormField(
      hintText: 'enter your task details',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: (input) {},
    );
  }

  buildSelectTimeLabel() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Select time',
        style: isLight(context)
            ? LightTextStyles.text20WeightNormal
            .copyWith(color: Colors.black)
            : DarkTextStyles.text20WeightNormal,
      ),
    );
  }

  Widget buildTime() {
    return InkWell(
      onTap: () {
        showDatePickerCalendar(context);
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

Future<dynamic> showTaskBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddTaskBottomSheet(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
