import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/style.dart';

class ButtonPurple extends StatelessWidget {
  String label;
  Function onPressed;
  ButtonPurple({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        label,
        style: GoogleFonts.manrope(
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23,
            color: VivassimoTheme.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: VivassimoTheme.purpleActive,
        side: BorderSide(
          width: 2.0,
          color: VivassimoTheme.red,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
