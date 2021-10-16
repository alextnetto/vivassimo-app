import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VivassimoTheme.white,
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
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Termos de Uso',
                    style: customTextStyle(
                      FontWeight.w700,
                      23,
                      VivassimoTheme.purpleActive,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      height: 400,
                      color: VivassimoTheme.blue,
                      child: ListView(
                        padding: EdgeInsets.all(24),
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident. ',
                            style: customTextStyle(
                              FontWeight.w600,
                              17,
                              VivassimoTheme.purpleActive,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 324,
                      height: 60,
                      child: CustomButton1(
                        label: 'Ok',
                        primary: VivassimoTheme.green,
                        onPrimary: VivassimoTheme.white,
                        borderColor: VivassimoTheme.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
