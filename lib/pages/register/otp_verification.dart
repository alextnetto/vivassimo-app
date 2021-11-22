import 'package:flutter/material.dart';
import 'package:my_app/components/button_back.dart';
import 'package:my_app/components/button_confirm.dart';
import 'package:my_app/components/input_decoration.dart';
import 'package:my_app/components/loading_indicator.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';
import 'package:my_app/models/register/user.dart';
import 'package:my_app/services/backend.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
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
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 40,
                  ),
                  width: 320,
                  child: Text(
                    'Digite o código enviado por SMS (Mensagem de Texto)',
                    style: customTextStyle(
                      FontWeight.w700,
                      23,
                      VivassimoTheme.purpleActive,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 324,
                  child: PinCodeTextField(
                    autoFocus: true,
                    cursorColor: VivassimoTheme.purpleActive,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    onCompleted: (value) {},
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      selectedColor: VivassimoTheme.blue,
                      inactiveColor: VivassimoTheme.purpleActive, //
                      activeColor: VivassimoTheme.purpleActive,
                    ),
                    animationType: AnimationType.fade,
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
                  onPrimary: VivassimoTheme.white,
                  borderColor: VivassimoTheme.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
