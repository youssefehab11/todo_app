import 'package:todo_app/core/utils/helper_functions.dart';

class TaskDM {
  static String collectionName = 'Tasks';
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? state;
  TaskDM({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.state,
  });
  Map<String, dynamic> toJson() {
    return {
      'taskId': id,
      'taskTitle': title,
      'taskDescription': description,
      'taskDate': dateTime?.formatDate,
      'taskState': state,
    };
  }

  TaskDM.fromJson(Map<String, dynamic>? json) {
    id = json?['taskId'];
    title = json?['taskTitle'];
    description = json?['taskDescription'];
    dateTime = json?['taskDate'].toDate();
    state = json?['taskState'];
  }
}
