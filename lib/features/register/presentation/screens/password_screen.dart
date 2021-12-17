import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_back.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/password_store.dart';
import 'package:my_app/features/register/register_module.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key, required this.registerUserRequestModel})
      : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  PasswordScreenState createState() {
    return PasswordScreenState();
  }
}

class PasswordScreenState extends State<PasswordScreen> {
  RegisterUserRequestModel get registerUserRequestModel =>
      widget.registerUserRequestModel;
  PasswordStore? passwordStore;

  @override
  void initState() {
    initModule(RegisterModule());
    passwordStore = Modular.get<PasswordStore>();

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
                    'Agora escolha uma senha para acessar o aplicativo',
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
                            label: 'Digite uma senha',
                            onChanged: passwordStore!.setPassword,
                            errorText: passwordStore!.getPasswordError,
                            obscureText: passwordStore!.isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordStore!.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                passwordStore!.changePasswordVisibity();
                              },
                            ),
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
                            label: 'Digite novamente a senha',
                            onChanged: passwordStore!.setPasswordConfirmation,
                            errorText:
                                passwordStore!.getPasswordConfirmationError,
                            obscureText: passwordStore!.isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordStore!.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                passwordStore!.changePasswordVisibity();
                              },
                            ),
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
                child: ButtonConfirm(
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  onPrimary: VivassimoTheme.white,
                  borderColor: VivassimoTheme.white,
                  onPressed: () async {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
