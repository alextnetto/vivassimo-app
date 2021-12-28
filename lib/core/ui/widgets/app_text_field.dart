import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/ui/component_styles/input_decoration.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

import '../app_style.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final Function(String value)? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool readOnly;
  final Color? borderColor;
  final Color? textColor;
  final Function()? onEditingComplete;

  const AppTextField({
    required this.label,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    Key? key,
    this.placeholder,
    this.controller,
    this.keyBoardType,
    this.textAlign = TextAlign.center,
    this.focusNode,
    this.readOnly = false,
    this.borderColor,
    this.textColor,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: keyBoardType,
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      decoration: customInputDecoration1(
        label,
        errorText: errorText,
        suffixIcon: suffixIcon,
        placeholder: placeholder,
        borderColor: borderColor,
      ),
      textAlign: textAlign,
      style: customTextStyle(
        FontWeight.w700,
        18,
        textColor ?? VivassimoTheme.purpleActive,
      ),
    );
  }
}
