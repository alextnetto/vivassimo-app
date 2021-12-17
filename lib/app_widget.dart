import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';
import 'core/app_services/route_generator.dart';

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
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
