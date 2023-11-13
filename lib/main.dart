import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/root_page/root_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
    const MyApp(),
  );
}
