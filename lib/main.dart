import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/app_widget.dart';
import 'package:my_app/core/services/analytics_service.dart';
import 'package:my_app/core/shared_modules/cache/domain/usecases/cache_usecase.dart';
import 'package:my_app/core/utils/constants/app_constants.dart';
import 'package:my_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/services/connection_network_util.dart';
import 'core/services/push_notification_service.dart';
import 'core/services/routes_endpoints_config.dart';
import 'core/shared_modules/cache/cache_module.dart';
import 'core/stores/config_store.dart';
import 'core/utils/singleton_utils/app_util.dart';
import 'main_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PageUtils.setInstanceEnvironment();

  ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
  var connectivityResult = await (Connectivity().checkConnectivity());

  // ignore: unused_local_variable
  dynamic connectivitySubscription;
  connectionStatus.initialize();

  PageUtils.internetIsActive =
      connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;

  //Listen for connection change////
  connectivitySubscription = connectionStatus.connectionChange.listen((event) {
    debugPrint('tem internet');
    debugPrint(event.toString());
    PageUtils.internetIsActive = event;
  });

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  PushNotificationService pushNotification = PushNotificationService();
  await pushNotification.initFirebasePushNotification();
  pushNotification.initializeLocalNotifications();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  initModules([
    MainModule(),
    CacheModule(),
  ]);

  var configStore = Modular.get<ConfigStore>();
  var cacheUsecase = Modular.get<CacheUsecase>();

  configStore.routesEndpointsConfig = await RoutesEndpointsConfig.forEnvironment();

  var firebaseToken = await cacheUsecase.getCache(StringConstants.tokenFirebase);
  var firebaseTokenString = firebaseToken.getOrElse(() => '');
  var firebaseTokenEstaAtualizado = firebaseTokenString == pushNotification.getToken();

  if (firebaseTokenString != null && !firebaseTokenEstaAtualizado) {
    await PageUtils.cleanCache();
  }

  if (pushNotification.getToken() != null && firebaseTokenString == null) {
    cacheUsecase.setCache(StringConstants.tokenFirebase, pushNotification.getToken());
    debugPrint('TOKEN_FIREBASE');
    debugPrint(pushNotification.getToken());
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  var analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer = await AnalyticsService.setAnalytics(analytics);

  runZonedGuarded(() {
    return runApp(AppWidget(observer: observer));
  }, FirebaseCrashlytics.instance.recordError);
}
