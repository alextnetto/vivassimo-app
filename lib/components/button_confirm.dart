import 'package:flutter/material.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';

class ButtonConfirm extends StatelessWidget {
  final String label;
  final Color primary, onPrimary, borderColor;
  final Function onPressed;
  const ButtonConfirm({
    Key? key,
    required this.label,
    required this.primary,
    required this.onPrimary,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 80),
      height: 170,
      width: double.infinity,
      color: VivassimoTheme.blue,
      child: Align(
        child: SizedBox(
          width: 300,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              label,
              style: customTextStyle(
                FontWeight.w700,
                23,
                onPrimary,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: primary,
              side: BorderSide(
                width: 2.0,
                color: borderColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
