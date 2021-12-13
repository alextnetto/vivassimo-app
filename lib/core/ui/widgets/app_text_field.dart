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

  const AppTextField({
    required this.label,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    Key? key,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: customInputDecoration1(
        label,
        errorText: errorText,
        suffixIcon: suffixIcon,
        placeholder: placeholder,
      ),
      textAlign: TextAlign.center,
      style: customTextStyle(
        FontWeight.w700,
        18,
        VivassimoTheme.purpleActive,
      ),
    );
  }
}
