import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_purple.dart';
import 'package:my_app/config/style.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VivassimoTheme.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Hero(
              tag: 'registerAppBar',
              child: Container(
                height: 130,
                color: VivassimoTheme.blue,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBack(),
                        // texto
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'Criar uma conta',
                            style: GoogleFonts.manrope(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: VivassimoTheme.purpleActive,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
