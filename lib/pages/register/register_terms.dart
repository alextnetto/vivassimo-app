import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/config/style.dart';

class RegisterTerms extends StatefulWidget {
  const RegisterTerms({Key? key}) : super(key: key);

  @override
  _RegisterTermsState createState() => _RegisterTermsState();
}

class _RegisterTermsState extends State<RegisterTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 130,
              color: VivassimoTheme.white,
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
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.white,
                child: Text('oi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
