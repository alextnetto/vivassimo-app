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
