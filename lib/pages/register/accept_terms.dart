import 'package:flutter/material.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/button_confirm.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';

class RegisterTerms extends StatelessWidget {
  const RegisterTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VivassimoTheme.white,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: 'registerAppBar',
                  child: Container(
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
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Aceitar Termos de Uso',
                        style: customTextStyle(
                          FontWeight.w700,
                          23,
                          VivassimoTheme.purpleActive,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 324,
                        child: Text(
                          'Ao continuar o cadastro você estará aceitando nossos termos de uso',
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          width: 324,
                          height: 60,
                          child: CustomButton1(
                              label: 'Ler os termos de uso',
                              primary: VivassimoTheme.ice,
                              onPrimary: VivassimoTheme.grey,
                              borderColor: VivassimoTheme.blue,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/register/terms');
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonConfirm(
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  onPrimary: VivassimoTheme.white,
                  borderColor: VivassimoTheme.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register/name');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
