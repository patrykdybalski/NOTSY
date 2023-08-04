import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFAEBD7);
  static const Color primaryColor1 = Color(0xFF181818);
  static const Color secondaryColor = Color(0xFF454647);
  static const Color accentColor = Color(0xFF006633);
  static const Color dayColor = Color(0xFF006633);
  static const Color redColor = Color(0xFFb06218);
  static const Color redColor2 = Color.fromARGB(255, 193, 64, 28);
  static const Color greenColor = Color(0xff01D68E);
  static const Color selectedDayColor = Color(0xFF006633);
  static Gradient fabGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 193, 64, 28),
      Color.fromARGB(255, 242, 242, 11),
      Color(0xff01D68E),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static List<Color> availableColors = [
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
    Color(0xFF),
  ];

  // Dodaj inne kolory według potrzeb
}
