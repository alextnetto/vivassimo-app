import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  String? _token;

  // initFirebasePushNotification(firebaseMessagingBackgroundHandler) async {
  initFirebasePushNotification() async {
    // await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _token = await FirebaseMessaging.instance.getToken();
    debugPrint('=============TOKEN FIREBASE==================');
    debugPrint(_token);
  }

  initializeLocalNotifications() {
    // var initialzationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initialzationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      //If the permissons need to be moved to specific screen, uncomment these tree options below
      //   requestSoundPermission: false,
      // requestBadgePermission: false,
      // requestAlertPermission: false,

      //and call these function to request permission
      //   final bool result = await flutterLocalNotificationsPlugin
      // .resolvePlatformSpecificImplementation<
      //     IOSFlutterLocalNotificationsPlugin>()
      // ?.requestPermissions(
      // alert: true,
      // badge: true,
      // sound: true,
      // );
    );

    var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    //If use dynamic links, use onSelectionNotification parameter to manage it
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
              ),
            ));
      }
    });
  }

  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    debugPrint('Recebeu notificacao');
    // display a dialog with the notification details, tap ok to go to another page
  }

  getToken() {
    return _token;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  MainSingleton()
      .notificationStream
      .sink
      // .add(message.notification.title + "|" + message.notification.body);
      .add(message.data['title'] + "|" + message.data['body']);
  debugPrint('Handling a background message ${message.messageId}');
}

class MainSingleton {
  static final MainSingleton _singleton = MainSingleton._internal();

  /// The stream that is used to receive the redirectTo string from notification
  // ignore: close_sinks
  StreamController notificationStream = StreamController<String>.broadcast();

  factory MainSingleton() {
    return _singleton;
  }

  MainSingleton._internal();
}
