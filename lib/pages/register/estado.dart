import 'package:flutter/material.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/input_decoration.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
import 'package:my_app/models/register/user.dart';

class EstadoPage extends StatelessWidget {
  const EstadoPage({Key? key}) : super(key: key);

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
                'Qual o estado da sua residência?',
                style: customTextStyle(
                  FontWeight.w700,
                  23,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            EstadoForm(),
          ],
        ),
      ),
    );
  }
}

class EstadoForm extends StatefulWidget {
  const EstadoForm({Key? key}) : super(key: key);

  @override
  EstadoFormState createState() {
    return EstadoFormState();
  }
}

class EstadoFormState extends State<EstadoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: 324,
            height: 90,
            // TODO: Select for estados
            child: TextFormField(
              initialValue: RegisterUser.instance.estado,
              onSaved: (value) {
                RegisterUser.instance.estado = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo vazio';
                }
                return null;
              },
              decoration: customInputDecoration1('Digite aqui o estado'),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pushNamed('/register/cidade');
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