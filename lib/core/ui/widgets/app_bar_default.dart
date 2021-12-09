import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/button_back.dart';

import '../app_style.dart';

class AppBarDefaultWidget extends StatelessWidget {
  final String title;

  const AppBarDefaultWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonBack(),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            title,
            style: customTextStyle(
              FontWeight.w700,
              18,
              VivassimoTheme.purpleActive,
            ),
          ),
        )
      ],
    );
  }
}
