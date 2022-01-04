import 'package:flutter/material.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class DropdownListWidget extends StatelessWidget {
  final String storeValue;
  final List<String> contentList;
  final Function(String? value) onChanged;
  final String? labelText;
  final Color? fillCollor;
  final TextStyle? contentStyle;
  final Widget? icon;
  final Color? borderColor;

  const DropdownListWidget({
    Key? key,
    required this.storeValue,
    required this.contentList,
    required this.onChanged,
    this.labelText,
    this.fillCollor,
    this.contentStyle,
    this.icon,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            fillColor: fillCollor,
            filled: fillCollor != null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: borderColor ?? const Color(0XFF006633),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            labelText: labelText,
            labelStyle: customTextStyle(
              FontWeight.w700,
              20,
              VivassimoTheme.purpleActive,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 19,
            ),
          ),
          // isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: storeValue,
              isDense: true,
              style: contentStyle,
              dropdownColor: fillCollor,
              icon: icon,
              // isExpanded: true,
              // style: ,
              onChanged: (String? value) {
                onChanged(value);
                state.didChange(value);
              },
              items: contentList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
