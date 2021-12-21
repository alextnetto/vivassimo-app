import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';

class ButtonBack extends StatelessWidget {
  final Function()? handleBackButton;
  const ButtonBack({
    Key? key,
    this.handleBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (handleBackButton != null) {
            handleBackButton!();
          } else {
            Navigator.pop(context);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.arrow_back),
            Text(
              'Voltar',
              style: customTextStyle(
                FontWeight.w700,
                18,
                VivassimoTheme.white,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: VivassimoTheme.purpleActive,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
