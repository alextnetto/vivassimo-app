import 'package:flutter/material.dart';

import '../app_style.dart';

class DropdownListWithModelWidget extends StatelessWidget {
  final dynamic storeValue;
  // final List<String> contentList;
  final List<dynamic> contentList;
  final Function(dynamic value) onChanged;
  final String? labelText;
  final Color? fillCollor;
  final TextStyle? contentStyle;
  final Widget? icon;

  const DropdownListWithModelWidget({
    Key? key,
    required this.storeValue,
    required this.contentList,
    required this.onChanged,
    this.labelText,
    this.fillCollor,
    this.contentStyle,
    this.icon,
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
                color: VivassimoTheme.purpleActive,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            labelText: labelText,
          ),
          // isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
              value: storeValue.name,
              isDense: true,
              style: contentStyle,
              dropdownColor: fillCollor,
              icon: icon,
              // isExpanded: true,
              // style: ,
              onChanged: (dynamic value) {
                onChanged(value);
                state.didChange(value.name);
              },
              items: contentList.map((dynamic value) {
                return DropdownMenuItem<dynamic>(
                  value: value.name,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
