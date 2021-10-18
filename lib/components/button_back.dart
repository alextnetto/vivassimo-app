import 'package:flutter/material.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
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
