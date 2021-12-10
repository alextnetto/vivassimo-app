import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/utils/enums/app_enums.dart';
import 'package:my_app/core/utils/singleton_utils/app_util.dart';

class RoutesEndpointsConfig {
  final String? apiUrl;
  final String? resourceWSAdmin;

  RoutesEndpointsConfig({
    this.apiUrl,
    this.resourceWSAdmin,
  });

  static Future<RoutesEndpointsConfig> forEnvironment() async {
    //pega o currentEnviroment dinamicamente
    String env = PageUtils.currentEnviroment == EnvironmentType.prod ? "prod" : "dev";

    debugPrint('==============AMBIENTE ATUAL==================');
    debugPrint(env);

    // load the json file
    String contents = '';

    try {
      contents = await rootBundle.loadString(
        'assets/endpoints_config/$env.json',
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return RoutesEndpointsConfig(
      apiUrl: json['apiUrl'],
      resourceWSAdmin: json['resourceWSAdmin'],
    );
  }
}
