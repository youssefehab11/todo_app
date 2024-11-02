import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppAuthProvider extends ChangeNotifier {
  User? currentUser;
  AppAuthProvider() {
    currentUser = FirebaseAuth.instance.currentUser;
  }
  void login(User newUser) {
    currentUser = newUser;
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) login(userCredential.user!);
    return userCredential;
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) login(userCredential.user!);
    return userCredential;
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
  }
}
