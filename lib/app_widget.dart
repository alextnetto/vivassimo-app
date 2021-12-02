import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/pages/login/login.dart';
import 'package:my_app/pages/register/address_1.dart';
import 'package:my_app/pages/register/cpf_page.dart';
import 'package:my_app/pages/register/accept_terms.dart';
import 'package:my_app/pages/register/register_1.dart';
import 'package:my_app/pages/register/password.dart';
import 'package:my_app/pages/register/register_2.dart';
import 'package:my_app/pages/register/register_finished.dart';
import 'package:my_app/pages/register/terms.dart';
import 'package:my_app/pages/register/otp_verification.dart';

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
              '/': (context) => HomePage(),
              '/register/acceptTerms': (context) => RegisterTerms(),
              '/register/terms': (context) => TermsPage(),
              '/register/verifyOtp': (context) => OtpVerificationPage(),
              '/register/1': (context) => Register1Page(),
              '/register/2': (context) => Register2Page(),
              '/register/password': (context) => PasswordPage(),
              '/register/cpf': (context) => CpfPage(),
              '/register/address1': (context) => Address1Page(),
              '/register/registerFinished': (context) => RegisterFinishedPage(),
              '/login': (context) => LoginPage(),
            },
          ),
        );
      },
    );
  }
}
