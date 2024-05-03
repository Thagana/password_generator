import 'package:cyberman/app/app.dart';
import 'package:cyberman/bootstrap.dart';
import 'package:cyberman/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await bootstrap(App.new);
}