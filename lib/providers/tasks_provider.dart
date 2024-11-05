// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/database/models/task_model.dart';

// class TasksProvider extends ChangeNotifier {
//   List<TaskDM> tasks = [];
//   late DateTime focusedDate;
//   TasksProvider() {
//     focusedDate = DateTime.now();
//   }
//   void getTasks() async {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     CollectionReference<Map<String, dynamic>> collectionReference =
//         db.collection(TaskDM.collectionName);
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await collectionReference.get();
//     List<QueryDocumentSnapshot> docs = querySnapshot.docs;
//     tasks = docs.map(
//       (doc) {
//         Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
//         return TaskDM.fromJson(json);
//       },
//     ).toList();
//     tasks = tasks.where((element) {
//       return element.dateTime.day == focusedDate.day &&
//           element.dateTime.month == focusedDate.month &&
//           element.dateTime.year == focusedDate.year;
//     }).toList();
//     //setState(() {});
//   }

//   void changeFocusedDate(DateTime selectedDate) {
//     if (selectedDate != focusedDate) {
//       focusedDate = selectedDate;
//     }
//   }
// }
