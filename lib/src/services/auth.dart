import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Devuelve el usuario desde el UserCredential
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Error al iniciar sesión: $e");
      // En lugar de devolver null aquí, podrías propagar la excepción
      rethrow;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error al cerrar sesión: $e");
      rethrow;
    }
  }
}
