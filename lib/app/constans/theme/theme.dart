import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400,
      inversePrimary: Colors.grey.shade800,
      tertiary: Colors.blue.shade700,
      error: Colors.red.shade600,
      outline: Colors.white24,
      outlineVariant: Colors.lightBlueAccent.shade100,
    ));

ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade400,
      tertiary: Colors.blue.shade700,
      error: Colors.red.shade600,
      outline: Colors.blueGrey.shade500,
      outlineVariant: Colors.blueGrey.shade600,
    ));
