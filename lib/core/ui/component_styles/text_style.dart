import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle(
  FontWeight fontWeight,
  double fontSize,
  Color color, {
  double? letterSpacing,
  double? lineHeight,
  TextDecoration? decoration,
}) {
  return GoogleFonts.manrope(
    textStyle: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      letterSpacing: letterSpacing,
      height: lineHeight,
      decoration: decoration,
      decorationColor: decoration != null ? Colors.red : null,
      decorationThickness: 2,
    ),
    // decoration: TextDecoration.none,
  );
}

class AppTextStyles {
  static TextStyle defaultTextStyleTitleBig = customTextStyle(FontWeight.bold, 26, Color(0XFF560955));
  static TextStyle defaultTextStyleTitleBig800 = customTextStyle(FontWeight.w800, 26, Color(0XFF560955));

  static TextStyle defaultTextStyleTitleMiddleBold =
      customTextStyle(FontWeight.bold, 23, Color(0XFF560955), letterSpacing: -0.6);

  static TextStyle defaultTextStyleTitleSmall600 =
      customTextStyle(FontWeight.w600, 18, Color(0XFF560955), letterSpacing: -0.6);

  static TextStyle defaultTextStyleTitle = customTextStyle(FontWeight.bold, 18, Color(0XFF560955));
  static TextStyle defaultTextStyleDescriptionGrey = customTextStyle(FontWeight.w600, 18, Color(0XFF635F75));
  static TextStyle defaultTextStyleDescriptionGreyBold = customTextStyle(FontWeight.bold, 18, Color(0XFF635F75));
  static TextStyle defaultTextStyleDescriptionPurple = customTextStyle(FontWeight.w600, 18, Color(0XFF4D0351));
}
