import 'package:flutter/material.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
import 'package:my_app/models/register/user.dart';

class RegisterFinishedPage extends StatefulWidget {
  const RegisterFinishedPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterFinishedPageState();
  }
}

class RegisterFinishedPageState extends State<RegisterFinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                VivassimoTheme.gradientMainBegin,
                VivassimoTheme.gradientMainEnd
              ],
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/register_bg1.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  SizedBox(
                    width: 320,
                    child: Text(
                      'Cadastro realizado com sucesso!',
                      textAlign: TextAlign.center,
                      style: customTextStyle(
                        FontWeight.w800,
                        34,
                        VivassimoTheme.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 232,
                    child: Text(
                      '${RegisterUser.instance.name}, te damos as boas-vindas ao Vivássimo!',
                      textAlign: TextAlign.center,
                      style: customTextStyle(
                        FontWeight.w800,
                        26,
                        VivassimoTheme.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/register_bg2.png',
                  ),
                  SizedBox(
                    width: 324,
                    height: 60,
                    child: CustomButton1(
                      label: 'Entrar',
                      primary: VivassimoTheme.yellow,
                      onPrimary: VivassimoTheme.purpleActive,
                      borderColor: VivassimoTheme.red,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
