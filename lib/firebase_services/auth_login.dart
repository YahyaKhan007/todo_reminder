// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';

class AuthLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentuser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

// Anonymous
  Future signInAnon() async {
    try {
      UserCredential userCred = await _auth.signInAnonymously();

      User? user = userCred.user;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // **********************************8
// Create With Email and Password
  Future creatUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCred.user;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

// SignIn With Email and Password
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCred.user;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("Sucessful");
    } catch (e) {
      print("error");
    }
  }
}
