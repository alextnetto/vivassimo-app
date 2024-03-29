import 'package:flutter/material.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

class RegisterFinishedScreen extends StatefulWidget {
  const RegisterFinishedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterFinishedScreenState();
  }
}

class RegisterFinishedScreenState extends State<RegisterFinishedScreen> {
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
              colors: [VivassimoTheme.gradientMainBegin, VivassimoTheme.gradientMainEnd],
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
                      //'${RegisterUser.instance.name}, te damos as boas-vindas ao Vivássimo!',
                      '',
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
                        if (AppHelpers.isInternetActive) {
                          executeRegisterAction();
                        } else {
                          Navigator.of(context).pushNamed('/internet-connection', arguments: {
                            'executeAction': executeRegisterAction,
                          });
                        }
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

  void executeRegisterAction() {
    Navigator.of(context).pushNamed('/signin_or_signup', arguments: {
      'redirectTo': '/home',
    });
  }
}
