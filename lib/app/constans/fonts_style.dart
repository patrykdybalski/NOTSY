import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static appBarStyle1(
    double size,
    Color color,
  ) {
    return GoogleFonts.dmSerifText(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static appBarStyle2(
    double size,
    Color color,
  ) {
    return GoogleFonts.dmSerifText(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static textStyle1(
    double size,
    Color color,
  ) {
    return GoogleFonts.roboto(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static textStyle2(
    double size,
    Color color,
  ) {
    return GoogleFonts.roboto(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
