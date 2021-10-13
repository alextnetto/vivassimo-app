import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/config/style.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: VivassimoTheme.white,
                ),
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: VivassimoTheme.purpleActive,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
