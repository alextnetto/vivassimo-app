import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/app_widget.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'core/app_services/connection_handler.dart';
import 'core/shared_modules/cache/cache_module.dart';
import 'features/main_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initModules([MainModule(), CacheModule()]);

  ConnectionHandler connectionStatus = ConnectionHandler.getInstance();
  var connectivityResult = await (Connectivity().checkConnectivity());

  // ignore: unused_local_variable
  dynamic _connectivitySubscription;

  connectionStatus.initialize();

  AppHelpers.isInternetActive =
      connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;

  _connectivitySubscription = connectionStatus.connectionChange.listen((event) {
    print('has internet');
    print(event);
    AppHelpers.isInternetActive = event;
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(AppWidget());
}
