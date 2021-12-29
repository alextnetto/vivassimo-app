import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/password_store.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key, required this.registerUserRequestModel}) : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  PasswordScreenState createState() {
    return PasswordScreenState();
  }
}

class PasswordScreenState extends State<PasswordScreen> {
  RegisterUserRequestModel get registerUserRequestModel => widget.registerUserRequestModel;
  PasswordStore passwordStore = Modular.get<PasswordStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: 'registerAppBar',
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                padding: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(180, 216, 216, 0.2),
                    border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2)))),
                child: Column(
                  children: const [
                    AppBarDefaultWidget(title: 'Crie uma conta'),
                    SizedBox(
                      height: 10,
                    ),
                    LinearProgressBar(textIndicator: '3/5', percentageValue: 0.60),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Escolha uma senha',
                style: customTextStyle(
                  FontWeight.w700,
                  23,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 90,
                    child: Observer(builder: (_) {
                      return AppTextField(
                        label: 'Digite uma senha',
                        onChanged: passwordStore.setPassword,
                        errorText: passwordStore.getPasswordError,
                        obscureText: passwordStore.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordStore.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            passwordStore.changePasswordVisibity();
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
                        onChanged: passwordStore.setPasswordConfirmation,
                        errorText: passwordStore.getPasswordConfirmationError,
                        obscureText: passwordStore.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordStore.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            passwordStore.changePasswordVisibity();
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 90)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(builder: (_) {
                  return ButtonConfirm(
                    label: 'Continuar',
                    primary: VivassimoTheme.green,
                    textColor: VivassimoTheme.white,
                    borderColor: passwordStore.enableButton ? Color(0xff006633) : VivassimoTheme.white,
                    onPressed: passwordStore.enableButton
                        ? () {
                            registerUserRequestModel.password = passwordStore.password;

                            Navigator.pushNamed(
                              context,
                              '/register/cpf',
                              arguments: {'registerUserRequestModel': registerUserRequestModel},
                            );
                          }
                        : null,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
