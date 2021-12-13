import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle(
  FontWeight fontWeight,
  double fontSize,
  Color color,
) {
  return GoogleFonts.manrope(
    textStyle: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    ),
    decoration: TextDecoration.none,
  );
}

class AppTextStyles {
  static TextStyle defaultTextStyleTitleBig = customTextStyle(FontWeight.bold, 26, Color(0XFF560955));
  static TextStyle defaultTextStyleTitleBig800 = customTextStyle(FontWeight.w800, 26, Color(0XFF560955));
  static TextStyle defaultTextStyleTitle = customTextStyle(FontWeight.bold, 18, Color(0XFF560955));
  static TextStyle defaultTextStyleDescriptionGrey = customTextStyle(FontWeight.w600, 18, Color(0XFF635F75));
  static TextStyle defaultTextStyleDescriptionPurple = customTextStyle(FontWeight.w600, 18, Color(0XFF4D0351));
}
