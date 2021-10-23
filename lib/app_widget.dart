import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/pages/register/address_or_location.dart';
import 'package:my_app/pages/register/birthday.dart';
import 'package:my_app/pages/register/cep_page.dart';
import 'package:my_app/pages/register/cpf_page.dart';
import 'package:my_app/pages/register/accept_terms.dart';
import 'package:my_app/pages/register/email.dart';
import 'package:my_app/pages/register/estado.dart';
import 'package:my_app/pages/register/gender.dart';
import 'package:my_app/pages/register/name.dart';
import 'package:my_app/pages/register/password.dart';
import 'package:my_app/pages/register/password_confirm.dart';
import 'package:my_app/pages/register/phonenumber.dart';
import 'package:my_app/pages/register/terms.dart';

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
              '/register/1': (context) => RegisterTerms(),
              '/register/terms': (context) => TermsPage(),
              '/register/name': (context) => NamePage(),
              '/register/email': (context) => EmailPage(),
              '/register/phonenumber': (context) => PhonenumberPage(),
              '/register/password': (context) => PasswordPage(),
              '/register/passwordConfirmation': (context) =>
                  PasswordConfirmPage(),
              '/register/cpf': (context) => CpfPage(),
              '/register/birthday': (context) => BirthdayPage(),
              '/register/gender': (context) => GenderPage(),
              '/register/addressOrLocation': (context) =>
                  AddressOrLocationPage(),
              '/register/cep': (context) => CepPage(),
              '/register/estado': (context) => EstadoPage(),
            },
          ),
        );
      },
    );
  }
}
