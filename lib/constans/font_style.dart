import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle headingStyle = GoogleFonts.domine(
    color: AppColors.secondaryColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle eventWidgetTextStyle1 = GoogleFonts.domine(
    color: AppColors.secondaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );
  static TextStyle eventWidgetTextStyle2 = GoogleFonts.domine(
    color: AppColors.secondaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w800,
  );

  static TextStyle noteWidgetTextStyle1 = GoogleFonts.domine(
    color: AppColors.secondaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle noteWidgetTextStyle2 = GoogleFonts.domine(
    color: AppColors.secondaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );
}
