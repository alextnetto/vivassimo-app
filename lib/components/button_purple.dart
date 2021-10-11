import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class ButtonPurple extends StatelessWidget {
  String label;
  ButtonPurple({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
        primary: VivassimoTheme.purple,
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
