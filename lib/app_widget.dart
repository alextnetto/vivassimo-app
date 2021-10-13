import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';
import 'package:my_app/config/style.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/pages/register/register_terms.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Vivassimo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/register/1': (context) => RegisterTerms(),
          },
        );
      },
    );
  }
}
