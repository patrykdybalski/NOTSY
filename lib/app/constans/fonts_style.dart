import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/constans/colors.dart';

class TextStyles {
  static appBarStyle1(
    double size,
  ) {
    return GoogleFonts.dmSerifText(
      color: Colors.grey.shade800,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static appBarStyle2(
    double size,
  ) {
    return GoogleFonts.dmSerifText(
      color: Colors.grey.shade800,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyle1(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: Colors.grey.shade800,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static textStyle3(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: Colors.grey.shade800,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleBlue2(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.blueAccent,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleBlue1(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.blueAccent,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static textStyleGreen1(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.greenColor,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleGreen2(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.greenColor,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static textStyle2(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static editNoteTextStyle(
    double size,
    Color color,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleRed(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.redColor,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static textStyleRed2(
    double size,
  ) {
    return GoogleFonts.roboto(
      color: AppColors.redColor,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleWhite(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static textStyleWhite1(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }
}
