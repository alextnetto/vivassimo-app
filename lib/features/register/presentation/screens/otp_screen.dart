import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/widgets/button_back.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/otp_store.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String redirectTo;
  final String phoneNumber;
  final Object? nextPageArguments;

  const OtpVerificationScreen(
      {Key? key, this.redirectTo = '/register/password', this.phoneNumber = '', this.nextPageArguments})
      : super(key: key);
class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key, required this.registerUserRequestModel})
      : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String get redirectTo => widget.redirectTo;
  String get phoneNumber => widget.phoneNumber;

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  RegisterUserRequestModel get registerUserRequestModel =>
      widget.registerUserRequestModel;
  OtpStore? otpStore;
  String errorMessage = '';

  validateOtp() async {
    LoadingIndicator.show(context);
    var response = await otpStore!.verifyOtp();
    LoadingIndicator.hide(context);

    if (response['valid']) {
      Navigator.pushNamed(context, redirectTo, arguments: widget.nextPageArguments);
    if (response.success) {
      Navigator.pushNamed(
        context,
        '/register/password',
        arguments: {'registerUserRequestModel': registerUserRequestModel},
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Ops!'),
          content: Text(response.message),
          contentPadding: EdgeInsets.all(20),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    otpStore = Modular.get<OtpStore>();
    otpStore!.setPhoneNumber(registerUserRequestModel.phoneNumber ?? '');

    otpStore!.sendOtp().then(
          (response) => {
            if (!response.success)
              {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Ops!'),
                    content: Text(response.message),
                    contentPadding: EdgeInsets.all(20),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                )
              }
          },
        );

    super.initState();
  }

  // @override
  // void initState() {
  //   BackendService.instance.sendOtp(phoneNumber.isNotEmpty ? phoneNumber : RegisterUser.instance.phoneNumber ?? '');
  //
  //   super.initState();
  // }

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
                    onChanged: otpStore!.setOtp,
                    onCompleted: (otp) async {
                      validateOtp();
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      selectedColor: VivassimoTheme.blue,
                      inactiveColor: VivassimoTheme.purpleActive, //
                      activeColor: VivassimoTheme.purpleActive,
                      errorBorderColor: VivassimoTheme.red,
                    ),
                    animationType: AnimationType.fade,
                    errorTextSpace: 30,
                    textStyle: customTextStyle(
                      FontWeight.w700,
                      20,
                      VivassimoTheme.purpleActive,
                    ),
                  ),
                ),
                Text(
                  errorMessage,
                  style: customTextStyle(
                    FontWeight.w700,
                    23,
                    VivassimoTheme.redActive,
                  ),
                )
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
                    await validateOtp();
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
