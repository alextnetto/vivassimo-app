import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/input_decoration.dart';
import 'package:my_app/components/loading_indicator.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
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

  final _formKey = GlobalKey<FormState>();

  bool _isValidLoginAsync = true;
  bool _passwordVisible = false;
  String _password = '';

  var maskFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

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
                            'Acesso a conta',
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
              padding: EdgeInsets.symmetric(vertical: 30),
              width: 320,
              child: Text(
                'Informe seu email ou telefone cadastrado e a senha',
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
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskFormatter],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Telefone incompleto';
                        }
                        return null;
                      },
                      decoration:
                          customInputDecoration1('Digite aqui seu telefone'),
                      textAlign: TextAlign.center,
                      style: customTextStyle(
                        FontWeight.w700,
                        18,
                        VivassimoTheme.purpleActive,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 324,
                      height: 90,
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        enableSuggestions: false,
                        autocorrect: false,
                        onSaved: (value) {
                          _password = value ?? '';
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                        decoration: customInputDecoration1(
                          'Digite letras e números',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        textAlign: TextAlign.center,
                        style: customTextStyle(
                          FontWeight.w700,
                          18,
                          VivassimoTheme.purpleActive,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 324,
                    height: 60,
                    child: CustomButton1(
                      label: 'Entrar',
                      primary: VivassimoTheme.green,
                      onPrimary: VivassimoTheme.white,
                      borderColor: VivassimoTheme.white,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          LoadingIndicator.show(context);
                          var response = await loginStore!.login(
                            maskFormatter.getUnmaskedText(),
                            _password,
                          );
                          LoadingIndicator.hide(context);

                          if (response == 'Success') {
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/', (route) => false);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Localização falhou'),
                                content: Text(response),
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

                          //TODO: Get token and save it
                        }
                      },
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
