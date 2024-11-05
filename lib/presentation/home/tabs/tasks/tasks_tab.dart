import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/calendar.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/tasks_list.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Calendar(
          focusedDate: focusedDate,
          onDateChange: onDateChange,
        ),
        TasksList(
          selectedDate: focusedDate,
        ),
      ],
    );
  }

  void onDateChange(DateTime selectedDate) {
    setState(() {
      focusedDate = selectedDate;
    });
    //getTasks();
  }

  // void getTasks() async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   CollectionReference<Map<String, dynamic>> collectionReference =
  //       db.collection(TaskDM.collectionName);
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //       await collectionReference.get();
  //   List<QueryDocumentSnapshot> docs = querySnapshot.docs;
  //   tasks = docs.map(
  //     (doc) {
  //       Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
  //       return TaskDM.fromJson(json);
  //     },
  //   ).toList();
  //   tasks = tasks.where((element) {
  //     return element.dateTime.day == focusedDate.day &&
  //         element.dateTime.month == focusedDate.month &&
  //         element.dateTime.year == focusedDate.year;
  //   }).toList();
  //   setState(() {});
  // }
}
