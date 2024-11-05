import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/database/collections/users_collection.dart';
import 'package:todo_app/database/models/user_dm.dart';

class AppAuthProvider extends ChangeNotifier {
  User? authUser;
  UsersCollection usersCollection = UsersCollection();
  AppAuthProvider() {
    authUser = FirebaseAuth.instance.currentUser;
  }
  void login(User newUser) {
    authUser = newUser;
  }

  String? getUserId() {
    return authUser?.uid;
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String fullName,
  ) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      UserDM user = UserDM(
        userId: userCredential.user?.uid,
        fullName: fullName,
        email: email,
      );
      await UsersCollection.saveUserToFireStore(user);
      login(userCredential.user!);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) login(userCredential.user!);
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    authUser = null;
  }
}
