import 'package:flutter/material.dart';
import 'package:gastos_app/src/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final db = FirebaseFirestore.instance;
  db.settings = const Settings(persistenceEnabled: true);

  runApp(const MyApp());
}


