import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/app_masks/app_masks.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/register_step_two_store.dart';

class RegisterStepTwoScreen extends StatefulWidget {
  const RegisterStepTwoScreen({Key? key, required this.registerUserRequestModel}) : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  _RegisterStepTwoScreenState createState() => _RegisterStepTwoScreenState();
}

class _RegisterStepTwoScreenState extends State<RegisterStepTwoScreen> {
  RegisterUserRequestModel get registerUserRequestModel => widget.registerUserRequestModel;

  RegisterStepTwoStore registerStepTwoStore = Modular.get<RegisterStepTwoStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: 'registerAppBar',
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
                    LinearProgressBar(textIndicator: '5/5', percentageValue: 1),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Qual sua data de \n nascimento e gênero?',
                style: customTextStyle(
                  FontWeight.w800,
                  26,
                  VivassimoTheme.purpleActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
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
                        label: 'Data de nascimento',
                        onChanged: registerStepTwoStore.setDataNascimento,
                        errorText: registerStepTwoStore.getDataNascimentoError,
                        inputFormatters: [AppMasks.dataNascimento],
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
                      focusedBorder: InputBorder.none,
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
                    items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: registerStepTwoStore.setGenero,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 70)),
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
                      borderColor: registerStepTwoStore.enableButton ? Color(0xff006633) : VivassimoTheme.grey,
                      onPressed: registerStepTwoStore.enableButton
                          ? () {
                              registerUserRequestModel.genero = registerStepTwoStore.genero;
                              registerUserRequestModel.dataNascimento = registerStepTwoStore.dataNascimento;

                              Navigator.pushNamed(
                                context,
                                '/register/address1',
                                arguments: {'registerUserRequestModel': registerUserRequestModel},
                              );
                            }
                          : null,
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
