import 'package:flutter/material.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/input_decoration.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/utils/formatters/app_formatter.dart';
import 'package:my_app/models/register/user.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  PasswordScreenState createState() {
    return PasswordScreenState();
  }
}

class PasswordScreenState extends State<PasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  final TextEditingController _passwordController = TextEditingController();

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
                      children: const [
                        SizedBox(
                          height: 40,
                        ),
                        AppBarDefaultWidget(title: 'Criar uma conta'),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     ButtonBack(),
                        //     // texto
                        //     Padding(
                        //       padding: const EdgeInsets.only(right: 30),
                        //       child: Text(
                        //         'Criar uma conta',
                        //         style: customTextStyle(
                        //           FontWeight.w700,
                        //           18,
                        //           VivassimoTheme.purpleActive,
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // )
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 324,
                        height: 90,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          enableSuggestions: false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            AppFormatter.passwordFormatter,
                          ],
                          autocorrect: false,
                          onSaved: (value) {
                            RegisterUser.instance.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Senha inválida';
                            }
                            return null;
                          },
                          decoration: customInputDecoration1(
                            'Digite a senha de 6 digitos',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                      SizedBox(
                        width: 324,
                        height: 90,
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            AppFormatter.passwordFormatter,
                          ],
                          onSaved: (value) {
                            RegisterUser.instance.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Senha inválida';
                            } else if (value != _passwordController.text) {
                              return 'Senhas não conferem';
                            }
                            return null;
                          },
                          decoration: customInputDecoration1(
                            'Digite novamente a senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                  textColor: VivassimoTheme.white,
                  borderColor: VivassimoTheme.white,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.of(context).pushNamed('/register/cpf');
                    }
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
