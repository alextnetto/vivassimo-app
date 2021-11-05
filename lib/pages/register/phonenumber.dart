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
import 'package:my_app/services/backend.dart';

class PhonenumberPage extends StatelessWidget {
  const PhonenumberPage({Key? key}) : super(key: key);

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
                'E o número do seu telefone celular com DDD',
                style: customTextStyle(
                  FontWeight.w700,
                  23,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            PhonenumberForm(),
          ],
        ),
      ),
    );
  }
}

class PhonenumberForm extends StatefulWidget {
  const PhonenumberForm({Key? key}) : super(key: key);

  @override
  PhonenumberFormState createState() {
    return PhonenumberFormState();
  }
}

class PhonenumberFormState extends State<PhonenumberForm> {
  final _formKey = GlobalKey<FormState>();

  bool _phonenumberExistsAsync = true;

  isValidPhonenumber() {
    if (maskFormatter.getUnmaskedText().length == 11) {
      return true;
    }
    return false;
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

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
              keyboardType: TextInputType.phone,
              inputFormatters: [maskFormatter],
              validator: (value) {
                if (!isValidPhonenumber()) {
                  return 'Telefone inválido';
                } else if (_phonenumberExistsAsync) {
                  return 'Telefone já cadastrado';
                }
                return null;
              },
              decoration:
                  customInputDecoration1('Digite aqui seu número de celular'),
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
                  loadingIndicator(context);
                  var response = await BackendService.instance
                      .userExists(maskFormatter.getUnmaskedText());
                  Navigator.pop(context);

                  if (response['valid']) {
                    _phonenumberExistsAsync = response['data'];
                  }
                  if (_formKey.currentState!.validate()) {
                    RegisterUser.instance.phonenumber =
                        maskFormatter.getUnmaskedText();
                    Navigator.of(context).pushNamed('/register/password');
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
