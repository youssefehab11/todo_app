import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/database/models/task_model.dart';
import 'package:todo_app/database/models/user_dm.dart';

class TasksCollection {
  CollectionReference<TaskDM> getTasksCollection(String userId) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db
        .collection(UserDM.collectionName)
        .doc(userId)
        .collection(TaskDM.collectionName)
        .withConverter(fromFirestore: (snapshot, options) {
      return TaskDM.fromJson(snapshot.data());
    }, toFirestore: (task, options) {
      return task.toJson();
    });
  }

  Future<void> saveTasksToFireStore({
    required String userId,
    required String title,
    required String description,
    required DateTime date,
  }) {
    DocumentReference taskDocumentReference = getTasksCollection(userId).doc();

    TaskDM newTask = TaskDM(
      id: taskDocumentReference.id,
      title: title,
      description: description,
      dateTime: date,
      state: false,
    );
    return taskDocumentReference.set(newTask);
  }

  Stream<QuerySnapshot<TaskDM>> getTasksFromFireStore(
      String userId, DateTime selectedDate) async* {
    yield* getTasksCollection(userId)
        .where('taskDate', isEqualTo: selectedDate.formatDate)
        .snapshots();
  }

  Future<void> deleteTaskFromFireStore(String userId, TaskDM task) {
    return getTasksCollection(userId).doc(task.id).delete();
  }

  Future<void> editTaskInFireStore(String userId, TaskDM task) {
    return getTasksCollection(userId).doc(task.id).update(task.toJson());
  }
}
