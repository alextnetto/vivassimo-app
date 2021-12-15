import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class AppButton extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final Function() onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const AppButton(
      {Key? key,
      required this.title,
      required this.fontWeight,
      required this.fontSize,
      required this.textColor,
      required this.buttonColor,
      required this.borderColor,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(horizontal: 45), this.margin = const EdgeInsets.only(top: 45)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: padding,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: customTextStyle(
            fontWeight,
            fontSize,
            textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          side: BorderSide(
            width: 2.0,
            color: borderColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
