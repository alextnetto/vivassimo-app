import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/utils/formatters/app_formatter.dart';
import 'package:my_app/features/login/login_module.dart';
import 'package:my_app/features/login/presentation/stores/login_store.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

class LoginScreen extends StatefulWidget {
  final String redirectTo;
  final Object? nextPageArguments;
  const LoginScreen({Key? key, required this.redirectTo, this.nextPageArguments}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String get redirectTo => widget.redirectTo;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'registerAppBar',
                child: Container(
                  // height: 90,
                  color: VivassimoTheme.white,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Column(
                    children: const [
                      AppBarDefaultWidget(title: 'Acesso a conta'),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Text(
                  'Informe o telefone cadastrado e a senha',
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
                            label: 'Digite a senha com 6 digitos',
                            onChanged: loginStore!.setPassword,
                            errorText: loginStore!.getPasswordError,
                            keyBoardType: TextInputType.number,
                            inputFormatters: [
                              AppFormatter.passwordFormatter,
                            ],
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
                              borderColor: loginStore!.enableButton ? Color(0xff006633) : VivassimoTheme.grey,
                              onPressed: loginStore!.enableButton
                                  ? () async {
                                      LoadingIndicator.show(context);
                                      var response = await loginStore!.login();
                                      LoadingIndicator.hide(context);

                                      if (response.success) {
                                        Navigator.of(context).pushNamed('/register/verifyOtp', arguments: {
                                          'redirectTo': redirectTo,
                                          'phoneNumber': loginStore!.phoneNumberFormatter.getUnmaskedText(),
                                          'nextPageArguments': widget.nextPageArguments,
                                        });
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
      ),
    );
  }
}
