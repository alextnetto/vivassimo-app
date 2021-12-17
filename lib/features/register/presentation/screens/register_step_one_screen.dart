import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_back.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/presentation/stores/register_store.dart';
import 'package:my_app/features/register/register_module.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({Key? key}) : super(key: key);

  @override
  _RegisterStepOneState createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  RegisterStepOneStore? registerStepOneStore;

  @override
  void initState() {
    initModule(RegisterModule());
    registerStepOneStore = Modular.get<RegisterStepOneStore>();

    super.initState();
  }

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
                    'Primeiro, nos informe o seu nome completo',
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
                      padding: EdgeInsets.only(top: 12),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 90,
                        child: Observer(builder: (_) {
                          return AppTextField(
                            label: 'Digite aqui seu nome completo',
                            onChanged: registerStepOneStore!.setName,
                            errorText: registerStepOneStore!.getNameError,
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 90,
                        child: Observer(builder: (_) {
                          return AppTextField(
                            label: 'Digite aqui seu email',
                            onChanged: registerStepOneStore!.setEmail,
                            errorText: registerStepOneStore!.getEmailError,
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 90,
                        child: Observer(builder: (_) {
                          return AppTextField(
                            label: 'Digite aqui seu telefone',
                            onChanged: registerStepOneStore!.setPhoneNumber,
                            errorText:
                                registerStepOneStore!.getPhoneNumberError,
                            inputFormatters: [
                              registerStepOneStore!.phoneNumberMask
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(builder: (_) {
                  return ButtonConfirm(
                    label: 'Continuar',
                    primary: VivassimoTheme.green,
                    onPrimary: VivassimoTheme.white,
                    borderColor: VivassimoTheme.white,
                    onPressed: registerStepOneStore!.enableButton
                        ? () async {
                            LoadingIndicator.show(context);
                            var response =
                                await registerStepOneStore!.userExists();
                            LoadingIndicator.hide(context);

                            if (response.success) {
                              if (response.userExists) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('Telefone já cadastrado'),
                                    content: Text(response.message),
                                    contentPadding: EdgeInsets.all(20),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                Navigator.of(context)
                                    .pushNamed('/register/verifyOtp');
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('Ops!'),
                                  content: Text(response.message),
                                  contentPadding: EdgeInsets.all(20),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        : null,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
