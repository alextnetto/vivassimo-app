import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/input_decoration.dart';
import 'package:my_app/components/loading_indicator.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
import 'package:my_app/models/register/user.dart';
import 'package:my_app/services/cep_to_address.dart';

class CepPage extends StatelessWidget {
  const CepPage({Key? key}) : super(key: key);

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
                'Digite o número do seu CEP',
                style: customTextStyle(
                  FontWeight.w700,
                  23,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CepForm(),
          ],
        ),
      ),
    );
  }
}

class CepForm extends StatefulWidget {
  const CepForm({Key? key}) : super(key: key);

  @override
  CepFormState createState() {
    return CepFormState();
  }
}

class CepFormState extends State<CepForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isValidCepAsync = true;

  var maskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    initialText: RegisterUser.instance.cep,
  );

  validateCep() async {
    var cepData = await cepToAddress(maskFormatter.getUnmaskedText());
    setState(() {
      if (cepData['valid']) {
        _isValidCepAsync = true;
      } else {
        _isValidCepAsync = false;
      }
    });
    return cepData;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: 324,
            height: 90,
            child: TextFormField(
              maxLength: 9,
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatter],
              initialValue: maskFormatter.getMaskedText(),
              validator: (value) {
                if (maskFormatter.getUnmaskedText().length < 8) {
                  return 'CEP incompleto';
                }
                if (!_isValidCepAsync) {
                  return 'CEP inválido';
                }
                return null;
              },
              decoration: customInputDecoration1('Digite aqui o CEP'),
              textAlign: TextAlign.center,
              style: customTextStyle(
                FontWeight.w700,
                18,
                VivassimoTheme.purpleActive,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              width: 324,
              height: 60,
              child: CustomButton1(
                label: 'Continuar',
                primary: VivassimoTheme.green,
                onPrimary: VivassimoTheme.white,
                borderColor: VivassimoTheme.white,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    loadingIndicator(context);
                    var cepAddress = await validateCep();
                    Navigator.pop(context);
                    // Validate again to show "CEP inválido" error
                    if (_formKey.currentState!.validate()) {
                      RegisterUser.instance.cep = cepAddress['cep'];
                      RegisterUser.instance.estado = cepAddress['uf'];
                      RegisterUser.instance.cidade = cepAddress['localidade'];
                      RegisterUser.instance.bairro = cepAddress['bairro'];
                      RegisterUser.instance.logradouro =
                          cepAddress['logradouro'];
                    }
                    //Navigator.of(context).pushNamed('/register/1');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
