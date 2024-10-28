import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/add_task_bottom_sheet/model/task_model.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/calendar.dart';
import 'package:todo_app/presentation/home/tabs/tasks/widgets/tasks_list.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  List<TaskDM> tasks = [];
  DateTime focusedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Calendar(
          focusedDate: focusedDate,
          onDateChange: onDateChange,
        ),
        TasksList(tasks: tasks),
      ],
    );
  }

  void onDateChange(DateTime selectedDate) {
    focusedDate = selectedDate;
    getTasks();
  }

  void getTasks() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collectionReference =
        db.collection(TaskDM.collectionName);
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    tasks = docs.map(
      (doc) {
        Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
        return TaskDM.fromJson(json);
      },
    ).toList();
    tasks = tasks.where((element) {
      return element.dateTime.day == focusedDate.day &&
          element.dateTime.month == focusedDate.month &&
          element.dateTime.year == focusedDate.year;
    }).toList();
    setState(() {});
  }
}
