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
  static const Color editButton = Color.fromARGB(255, 242, 242, 11);

  static Gradient fabGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 193, 64, 28),
      Color.fromARGB(255, 242, 242, 11),
      Color(0xff01D68E),
    ],
  );

  static List<Color> availableColors = const [
    Color(0xFFEEF1F6),
    Color.fromARGB(255, 214, 231, 213),
    Color(0xFFFCD8CC),
    Color(0xFFA5DBDD),
    Color(0xFFBDC3C7),
    Color.fromARGB(255, 106, 156, 116),
    Color.fromARGB(255, 209, 98, 98),
    Color(0xFF2980B9),
  ];
}
