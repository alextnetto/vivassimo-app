import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/login/login_module.dart';
import 'package:my_app/features/login/presentation/stores/login_store.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore? loginStore;

  @override
  void initState() {
    initModule(LoginModule());
    loginStore = Modular.get<LoginStore>();

    super.initState();
  }

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
                height: 90,
                color: VivassimoTheme.white,
                child: Column(
                  children: const [
                    SizedBox(height: 40),
                    AppBarDefaultWidget(title: 'Acesso a conta'),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     ButtonBack(),
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 30),
                    //       child: Text(
                    //         'Acesso a conta',
                    //         style: customTextStyle(
                    //           FontWeight.w700,
                    //           18,
                    //           VivassimoTheme.purpleActive,
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              width: 320,
              child: Text(
                'Informe seu telefone cadastrado e a senha',
                style: customTextStyle(
                  FontWeight.w700,
                  23,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 90,
                    child: Observer(builder: (_) {
                      return AppTextField(
                        label: 'Digite aqui seu telefone',
                        onChanged: loginStore!.setPhoneNumber,
                        errorText: loginStore!.getPhoneNumberError,
                        inputFormatters: [loginStore!.phoneNumberFormatter],
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 90,
                      child: Observer(builder: (_) {
                        return AppTextField(
                          label: 'Digite sua senha',
                          onChanged: loginStore!.setPassword,
                          errorText: loginStore!.getPasswordError,
                          obscureText: loginStore!.isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginStore!.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              loginStore!.changePasswordVisibity();
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
                      height: 60,
                      child: Observer(builder: (_) {
                        return SizedBox(
                          width: double.infinity,
                          child: CustomButton1(
                            label: 'Entrar',
                            primary: VivassimoTheme.green,
                            onPrimary: VivassimoTheme.white,
                            borderColor: VivassimoTheme.white,
                            onPressed: loginStore!.enableButton
                                ? () async {
                                    LoadingIndicator.show(context);
                                    var response = await loginStore!.login();
                                    LoadingIndicator.hide(context);

                                    if (response.success) {
                                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
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
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
