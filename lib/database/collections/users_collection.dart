import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/models/user_dm.dart';

class UsersCollection {
  static Future<void> saveUserToFireStore(UserDM user) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        db.collection(UserDM.collectionName);
    DocumentReference documentReference = collectionReference.doc(user.userId);
    return documentReference.set(user.toJson());
  }
}
