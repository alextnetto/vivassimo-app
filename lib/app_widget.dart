import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';
import 'package:my_app/features/home/presentation/screens/home_screen.dart';
import 'package:my_app/features/login/presentation/screens/login_screen.dart';
import 'package:my_app/features/register/presentation/screens/register_step_one_screen.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/pages/register/address2_page.dart';
import 'package:my_app/pages/register/address_1.dart';
import 'package:my_app/pages/register/cpf_page.dart';
import 'package:my_app/pages/register/accept_terms.dart';
import 'package:my_app/pages/register/register_1.dart';
import 'package:my_app/pages/register/password.dart';
import 'package:my_app/pages/register/register_2.dart';
import 'package:my_app/pages/register/register_finished.dart';
import 'package:my_app/pages/register/terms.dart';
import 'package:my_app/pages/register/otp_verification.dart';

import 'features/home/presentation/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return Material(
          type: MaterialType.transparency,
          child: MaterialApp(
            title: 'Vivassimo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // '/': (context) => HomeScreen(),
              '/': (context) => SignInOrSignUpRedirectScreen(),
              '/register/address2': (context) => EstadoPage(),

              '/home': (context) => HomeScreen(),
              '/register/acceptTerms': (context) => RegisterTerms(),
              '/register/terms': (context) => TermsPage(),
              '/register/verifyOtp': (context) => OtpVerificationPage(),
              '/register/1': (context) => RegisterStepOne(),
              '/register/2': (context) => Register2Page(),
              '/register/password': (context) => PasswordPage(),
              '/register/cpf': (context) => CpfPage(),
              '/register/address1': (context) => Address1Page(),
              '/register/registerFinished': (context) => RegisterFinishedPage(),
              '/login': (context) => LoginScreen(),
            },
          ),
        );
      },
    );
  }
}
