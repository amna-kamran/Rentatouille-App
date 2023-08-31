import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentatouille/model/auth_data.dart';

class AuthProvider {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<UserCredential> register(String password, String email) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final data = AuthData(
        email: email,
      );

      await _firestore
          .collection('users')
          .doc(user.user!.uid)
          .set(data.toMap());

      return user;
    } catch (e) {
      debugPrint("Error in Auth Provider");
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<UserCredential> login(String email, String password) async {
    try {
      final creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return creds;
    } catch (e) {
      debugPrint("Error in Auth Provider");
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }

  static String? getCurrentUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  static String? getCurrentUserEmail() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  AuthData? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return AuthData(email: user.email);
    }
  }

  Stream<AuthData?>? get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  static storeGoogleUserInfoInFirestore() async {
    await _firestore
        .collection('users')
        .doc(getCurrentUserId())
        .set({"email": getCurrentUserEmail()});
  }
}
