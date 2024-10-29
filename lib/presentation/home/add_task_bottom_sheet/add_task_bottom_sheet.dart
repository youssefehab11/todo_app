import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/widgets/bottom_sheet_title.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/widgets/confirm_button.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/widgets/task_info.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.48,
      padding: const EdgeInsets.all(16.0),
      margin: MediaQuery.viewInsetsOf(context),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const BottomSheetTitle(),
              SizedBox(
                height: size.height * 0.025,
              ),
              TaskInfo(
                selectedDate: selectedDate,
                onDatePressed: showDatePickerCalendar,
                taskTitleController: taskTitleController,
                taskDescriptionController: taskDescriptionController,
              ),
              SizedBox(height: size.height * 0.02),
              ConfirmButton(
                formKey: formKey,
                taskTitleController: taskTitleController,
                taskDescriptionController: taskDescriptionController,
                datePickerSelectedDate: selectedDate,
              ),
              SizedBox(height: size.height * 0.025),
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
}

Future<dynamic> showTaskBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddTaskBottomSheet(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
