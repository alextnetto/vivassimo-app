import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/input_decoration.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/models/register/user.dart';

class CpfScreen extends StatefulWidget {
  const CpfScreen({Key? key}) : super(key: key);

  @override
  CpfScreenState createState() {
    return CpfScreenState();
  }
}

class CpfScreenState extends State<CpfScreen> {
  final _formKey = GlobalKey<FormState>();

  var maskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
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
                    'Digite o número do seu CPF',
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [maskFormatter],
                          onSaved: (value) {
                            RegisterUser.instance.cpf =
                                maskFormatter.getUnmaskedText();
                          },
                          validator: (value) {
                            if (!CPFValidator.isValid(value)) {
                              return 'CPF inválido';
                            }
                            return null;
                          },
                          decoration:
                              customInputDecoration1('Digite aqui o CPF'),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.of(context).pushNamed('/register/2');
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
