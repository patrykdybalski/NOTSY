import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/constans/colors.dart';

class TextStyles {
  static textStyle1(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static textStyle3(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleBlue1(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: AppColors.blueAccent,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyle2(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static textStyleRed(
    double size,
  ) {
    return GoogleFonts.poppins(
      color: AppColors.redColor,
      fontSize: size,
      fontWeight: FontWeight.normal,
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
