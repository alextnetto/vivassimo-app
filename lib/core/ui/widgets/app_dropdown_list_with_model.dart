import 'package:flutter/material.dart';
import 'package:my_app/core/entities/credit_card_entity.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

import '../app_style.dart';

class DropdownListWithModelWidget extends StatelessWidget {
  final CreditCardEntity selectedValue;
  // final List<String> contentList;
  final List<CreditCardEntity> contentList;
  final Function(CreditCardEntity value) onChanged;
  final String? labelText;
  final Color? fillCollor;
  final TextStyle? contentStyle;
  final Widget? icon;

  const DropdownListWithModelWidget({
    Key? key,
    required this.selectedValue,
    required this.contentList,
    required this.onChanged,
    this.labelText,
    this.fillCollor,
    this.contentStyle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<CreditCardEntity>(
      builder: (FormFieldState<CreditCardEntity> state) {
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
            child: DropdownButton<CreditCardEntity>(
              value: selectedValue,
              isDense: true,
              style: contentStyle,
              dropdownColor: fillCollor,
              icon: icon,
              // isExpanded: true,
              // style: ,
              onChanged: (CreditCardEntity? value) {
                onChanged(value!);
                state.didChange(value);
              },
              items: contentList.map((CreditCardEntity value) {
                return DropdownMenuItem<CreditCardEntity>(
                  value: value,
                  child: Text(value.id == 0 ? value.number ?? '' : AppHelpers.formatItemToDropDown(value.number ?? '')),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
