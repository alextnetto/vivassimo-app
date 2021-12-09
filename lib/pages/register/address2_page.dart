import 'package:flutter/material.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/input_decoration.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/models/register/user.dart';
import 'package:my_app/services/backend.dart';

class EstadoScreen extends StatelessWidget {
  const EstadoScreen({Key? key}) : super(key: key);

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
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
                    decoration: customInputDecoration1('UF'),
                    textAlign: TextAlign.center,
                    style: customTextStyle(
                      FontWeight.w700,
                      18,
                      VivassimoTheme.purpleActive,
                    ),
                  ),
                ),
                SizedBox(
                  width: 224,
                  height: 90,
                  // TODO: Select for cidades
                  child: TextFormField(
                    initialValue: RegisterUser.instance.cidade,
                    onSaved: (value) {
                      RegisterUser.instance.cidade = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo vazio';
                      }
                      return null;
                    },
                    decoration: customInputDecoration1('Digite aqui a cidade'),
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
          SizedBox(
            width: 324,
            height: 90,
            child: TextFormField(
              initialValue: RegisterUser.instance.bairro,
              onSaved: (value) {
                RegisterUser.instance.bairro = value;
              },
              decoration: customInputDecoration1('Digite aqui o bairro'),
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
            // TODO: Select for logradouro
            child: TextFormField(
              initialValue: RegisterUser.instance.logradouro,
              onSaved: (value) {
                RegisterUser.instance.logradouro = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo vazio';
                }
                return null;
              },
              decoration: customInputDecoration1('Digite aqui o logradouro'),
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
              initialValue: RegisterUser.instance.numero,
              onSaved: (value) {
                RegisterUser.instance.numero = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo vazio';
                }
                return null;
              },
              decoration: customInputDecoration1('Digite aqui o número'),
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
                    _formKey.currentState!.save();

                    LoadingIndicator.show(context);
                    var response = await BackendService.instance.registerUser(RegisterUser.instance);
                    LoadingIndicator.hide(context);

                    if (response['valid']) {
                      Navigator.of(context).pushNamed('/register/registerFinished');
                    }
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
