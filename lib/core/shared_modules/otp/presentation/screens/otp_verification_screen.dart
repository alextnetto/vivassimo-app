import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/core/shared_modules/otp/presentation/stores/otp_store.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String redirectTo;
  final String phoneNumber;
  final Object? nextPageArguments;
  final RegisterUserRequestModel? registerUserRequestModel;

  const OtpVerificationScreen(
      {Key? key,
      this.redirectTo = '/register/password',
      this.phoneNumber = '',
      this.nextPageArguments,
      required this.registerUserRequestModel})
      : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String get redirectTo => widget.redirectTo;
  String get phoneNumber => widget.phoneNumber;
  // RegisterUserRequestModel get registerUserRequestModel => widget.registerUserRequestModel;
  OtpStore? otpStore;
  String errorMessage = '';

  validateOtp() async {
    LoadingIndicator.show(context);
    var response = await otpStore!.verifyOtp();
    LoadingIndicator.hide(context);

    if (response.success) {
      if (widget.registerUserRequestModel != null) {
        Navigator.pushNamed(
          context,
          '/register/password',
          arguments: {'registerUserRequestModel': widget.registerUserRequestModel},
        );
      } else {
        Navigator.pushNamed(context, redirectTo, arguments: widget.nextPageArguments);
      }
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
    if (widget.registerUserRequestModel != null) {
      otpStore!.setPhoneNumber(widget.registerUserRequestModel!.phoneNumber ?? '');
    } else {
      otpStore!.setPhoneNumber(phoneNumber);
    }

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
                        LinearProgressBar(textIndicator: '2/5', percentageValue: 0.40),
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
