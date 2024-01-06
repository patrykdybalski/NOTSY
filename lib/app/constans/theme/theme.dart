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
      tertiary: const Color.fromARGB(255, 5, 123, 196),
      error: const Color(0xFF8F2B2B),
    ));

ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade400,
      tertiary: const Color.fromARGB(255, 5, 123, 196),
      error: const Color(0xFF8F2B2B),
    ));
