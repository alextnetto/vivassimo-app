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
import 'package:my_app/features/register/presentation/stores/cpf_store.dart';

class CpfScreen extends StatefulWidget {
  const CpfScreen({Key? key, required this.registerUserRequestModel}) : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  CpfScreenState createState() {
    return CpfScreenState();
  }
}

class CpfScreenState extends State<CpfScreen> {
  RegisterUserRequestModel get registerUserRequestModel => widget.registerUserRequestModel;
  CpfStore? cpfStore;

  @override
  void initState() {
    cpfStore = Modular.get<CpfStore>();
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
                        LinearProgressBar(textIndicator: '4/5', percentageValue: 0.80),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Digite o número \n do seu CPF',
                    style: customTextStyle(
                      FontWeight.w800,
                      26,
                      VivassimoTheme.purpleActive,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 90,
                    child: Observer(builder: (_) {
                      return AppTextField(
                        label: 'Digite aqui o CPF',
                        onChanged: cpfStore!.setCpf,
                        errorText: cpfStore!.getCpfError,
                        inputFormatters: [AppMasks.cpf],
                      );
                    }),
                  ),
                ),
              ],
            ),
            Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(builder: (_) {
                  return ButtonConfirm(
                    label: 'Continuar',
                    primary: VivassimoTheme.green,
                    textColor: VivassimoTheme.white,
                    borderColor: cpfStore!.enableButton ? Color(0xff006633) : VivassimoTheme.grey,
                    onPressed: cpfStore!.enableButton
                        ? () {
                            registerUserRequestModel.cpf = cpfStore!.cpf;

                            Navigator.pushNamed(
                              context,
                              '/register/2',
                              arguments: {'registerUserRequestModel': registerUserRequestModel},
                            );
                          }
                        : null,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
