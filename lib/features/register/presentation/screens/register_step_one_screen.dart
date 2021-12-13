import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_back.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/input_decoration.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/presentation/stores/register_store.dart';
import 'package:my_app/features/register/register_module.dart';
import 'package:my_app/models/register/user.dart';
import 'package:my_app/services/backend.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({Key? key}) : super(key: key);

  @override
  _RegisterStepOneState createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  RegisterStepOneStore? registerStepOneStore;

  final _formKey = GlobalKey<FormState>();

  bool _phonenumberExistsAsync = true;

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 324,
                        height: 90,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          onSaved: (value) {
                            RegisterUser.instance.name = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo vazio';
                            }
                            return null;
                          },
                          decoration: customInputDecoration1(
                              'Digite aqui seu nome completo'),
                          textAlign: TextAlign.center,
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 324,
                        height: 90,
                        child: TextFormField(
                          //initialValue: 'dev@dev.com',
                          onSaved: (value) {
                            RegisterUser.instance.email = value;
                          },
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email inválido';
                            }
                            return null;
                          },
                          decoration:
                              customInputDecoration1('Digite aqui seu email'),
                          textAlign: TextAlign.center,
                          style: customTextStyle(
                            FontWeight.w700,
                            18,
                            VivassimoTheme.purpleActive,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 90,
                        child: Observer(builder: (_) {
                          return AppTextField(
                            label: 'Digite aqui seu telefone',
                            onChanged: registerStepOneStore!.setPhoneNumber,
                            errorText:
                                registerStepOneStore!.getPhoneNumberError,
                            inputFormatters: [
                              registerStepOneStore!.phoneNumberFormatter
                            ],
                          );
                        }),
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
                  onPressed: () async {
                    // Checks if phonenumber is already registered
                    LoadingIndicator.show(context);
                    var response = registerStepOneStore!.userExists();
                    print(response);
                    LoadingIndicator.hide(context);
                    // LoadingIndicator.show(context);
                    // var response = await BackendService.instance
                    //     .userExists(phoneFormatter.getUnmaskedText());

                    // if (response['valid']) {
                    //   _phonenumberExistsAsync = response['data'];
                    // }

                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   await BackendService.instance
                    //       .sendOtp(phoneFormatter.getUnmaskedText());
                    //   LoadingIndicator.hide(context);
                    //   Navigator.of(context).pushNamed('/register/verifyOtp');
                    //   return;
                    // }
                    // LoadingIndicator.hide(context);
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
