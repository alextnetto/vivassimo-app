import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/core/ui/app_masks/app_masks.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/register_step_one_store.dart';
import 'package:my_app/features/register/register_module.dart';

class RegisterStepOneScreen extends StatefulWidget {
  const RegisterStepOneScreen({Key? key}) : super(key: key);

  @override
  _RegisterStepOneState createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOneScreen> {
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
        // height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
                    LinearProgressBar(textIndicator: '1/5', percentageValue: 0.20),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: 300,
                child: Text(
                  'Crie uma conta agora!',
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
                          label: 'Digite seu nome completo',
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
                          label: 'Digite seu email',
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
                          label: 'Digite seu telefone',
                          onChanged: registerStepOneStore!.setPhoneNumber,
                          errorText: registerStepOneStore!.getPhoneNumberError,
                          inputFormatters: [AppMasks.phoneFormatter],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
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
                      borderColor: registerStepOneStore!.enableButton ? Color(0xff006633) : Colors.grey,
                      onPressed: registerStepOneStore!.enableButton
                          ? () async {
                              LoadingIndicator.show(context);
                              var response = await registerStepOneStore!.userExists();
                              LoadingIndicator.hide(context);

                              if (response.success) {
                                if (response.userExists!) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
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
                                  Navigator.of(context).pushNamed(
                                    '/register/verifyOtp',
                                    arguments: {
                                      'registerUserRequestModel': RegisterUserRequestModel(
                                        name: registerStepOneStore!.name,
                                        email: registerStepOneStore!.email,
                                        phoneNumber: registerStepOneStore!.phoneNumber,
                                      )
                                    },
                                  );
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
            ),
          ],
        ),
      ),
    );
  }
}
