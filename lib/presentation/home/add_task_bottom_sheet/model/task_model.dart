import 'package:cloud_firestore/cloud_firestore.dart';

class TaskDM {
  static String collectionName = 'Tasks';
  late String id;
  late String title;
  late String description;
  late DateTime dateTime;
  late bool state;
  TaskDM({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.state,
  });
  Map<String, dynamic> toJson() {
    return {
      'task_id': id,
      'task_title': title,
      'task_description': description,
      'task_date': dateTime,
      'task_state': state,
    };
  }

  TaskDM.fromJson(Map<String, dynamic> json) {
    id = json['task_id'];
    title = json['task_title'];
    description = json['task_description'];
    Timestamp timestamp = json['task_date'];
    dateTime = timestamp.toDate();
    state = json['task_state'];
  }
}
