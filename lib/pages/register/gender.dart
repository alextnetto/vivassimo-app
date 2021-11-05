import 'package:flutter/material.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
import 'package:my_app/models/register/user.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({Key? key}) : super(key: key);

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
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: 300,
              child: Text(
                'Qual seu gênero?',
                style: customTextStyle(
                  FontWeight.w700,
                  23,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 324,
                    height: 60,
                    child: CustomButton1(
                      label: 'Masculino',
                      primary: VivassimoTheme.green,
                      onPrimary: VivassimoTheme.white,
                      borderColor: VivassimoTheme.white,
                      onPressed: () {
                        RegisterUser.instance.gender = 'masculino';
                        Navigator.of(context)
                            .pushNamed('/register/addressOrLocation');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 324,
                    height: 60,
                    child: CustomButton1(
                      label: 'Feminino',
                      primary: VivassimoTheme.green,
                      onPrimary: VivassimoTheme.white,
                      borderColor: VivassimoTheme.white,
                      onPressed: () {
                        RegisterUser.instance.gender = 'feminino';
                        Navigator.of(context)
                            .pushNamed('/register/addressOrLocation');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 324,
                    height: 60,
                    child: CustomButton1(
                      label: 'Outro',
                      primary: VivassimoTheme.green,
                      onPrimary: VivassimoTheme.white,
                      borderColor: VivassimoTheme.white,
                      onPressed: () {
                        RegisterUser.instance.gender = 'outros';
                        Navigator.of(context)
                            .pushNamed('/register/addressOrLocation');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
