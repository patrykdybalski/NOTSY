import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFAEBD7);
  static const Color primaryColor1 = Color(0xFF181818);
  static const Color secondaryColor = Color.fromARGB(255, 18, 18, 19);
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
  static List<Color> availableColors = const [
    Color(0xFFFAC7C3),
    Color(0xFF38B4D0),
    Color(0xFFFFF7EC),
    Color(0xFFF57C51),
    Color(0xFFFCBC58),
    Color(0xFFF6F8E2),
    Color(0xFFE0DDCA),
    Color(0xFF407C87),
    Color(0xFFA5DBDD),
    Color(0xFFEEF1F6),
    Color(0xFF89687D),
    Color(0xFFFCD8CC),
    Color(0xFFFFF7EC),
    Color(0XFFEED5D1),
    Color(0xFFF38592),
    Color(0xFFD6517C),
  ];

  // Dodaj inne kolory według potrzeb
}
