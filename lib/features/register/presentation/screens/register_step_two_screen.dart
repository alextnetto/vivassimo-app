import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/register_step_two_store.dart';

class RegisterStepTwoScreen extends StatefulWidget {
  const RegisterStepTwoScreen(
      {Key? key, required this.registerUserRequestModel})
      : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  _RegisterStepTwoScreenState createState() => _RegisterStepTwoScreenState();
}

class _RegisterStepTwoScreenState extends State<RegisterStepTwoScreen> {
  RegisterUserRequestModel get registerUserRequestModel =>
      widget.registerUserRequestModel;
  RegisterStepTwoStore? registerStepTwoStore;

  @override
  void initState() {
    registerStepTwoStore = Modular.get<RegisterStepTwoStore>();
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
                      children: const [
                        SizedBox(
                          height: 40,
                        ),
                        AppBarDefaultWidget(title: 'Criar uma conta'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  child: Text(
                    'Qual sua data de nascimento e gênero?',
                    style: customTextStyle(
                      FontWeight.w700,
                      23,
                      VivassimoTheme.purpleActive,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 90,
                        child: Observer(builder: (_) {
                          return AppTextField(
                            label: 'Digite aqui a data',
                            onChanged: registerStepTwoStore!.setBrithday,
                            errorText: registerStepTwoStore!.getBirthdayError,
                            inputFormatters: [
                              registerStepTwoStore!.birthdayFormatter
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 324,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: VivassimoTheme.yellow,
                          width: 2,
                        ),
                        color: VivassimoTheme.yellow,
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          filled: true,
                          fillColor: VivassimoTheme.yellow,
                          hintText: 'Selecione o gênero',
                          hintStyle: customTextStyle(
                            FontWeight.w700,
                            20,
                            VivassimoTheme.purpleActive,
                          ),
                        ),
                        style: customTextStyle(
                          FontWeight.w700,
                          20,
                          VivassimoTheme.purpleActive,
                        ),
                        dropdownColor: VivassimoTheme.yellow,
                        iconEnabledColor: VivassimoTheme.purple,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: VivassimoTheme.purple,
                        ),
                        iconSize: 30,
                        isExpanded: true,
                        items: ['Masculino', 'Feminino', 'Outro']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: registerStepTwoStore!.setGender,
                      ),
                    ),
                  ],
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
                    onPressed: registerStepTwoStore!.enableButton
                        ? () {
                            registerUserRequestModel.genero =
                                registerStepTwoStore!.genero;
                            registerUserRequestModel.dataNascimento =
                                registerStepTwoStore!.dataNascimento;

                            Navigator.pushNamed(
                              context,
                              '/register/address1',
                              arguments: {
                                'registerUserRequestModel':
                                    registerUserRequestModel
                              },
                            );
                          }
                        : null,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
