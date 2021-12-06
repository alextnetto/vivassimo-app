import 'package:flutter/material.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';

InputDecoration customInputDecoration1(
  String label, {
  IconButton? suffixIcon,
  String? errorText = '',
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
    suffixIcon: suffixIcon,
    errorText: errorText,
    errorStyle: customTextStyle(
      FontWeight.w700,
      18,
      VivassimoTheme.redActive,
    ),
    alignLabelWithHint: true,
    labelText: label,
    labelStyle: customTextStyle(
      FontWeight.w700,
      18,
      VivassimoTheme.purpleActive,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: VivassimoTheme.redActive,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: VivassimoTheme.purpleActive,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: VivassimoTheme.purpleActive,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: VivassimoTheme.purpleActive,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}
