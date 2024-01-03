import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:primary_school/app/constans/theme/theme_provider.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/root_page/root_page.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
