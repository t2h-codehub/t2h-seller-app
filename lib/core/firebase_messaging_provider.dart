
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class FirebaseMessagingProvider {
  static Future<void> init() async {
    await setupFirebaseConfig();

    requestPermissionsLocalNotification();

    ///check when app opened first time without click
    FirebaseMessaging.instance.getInitialMessage().then(navigate);

    ///check when app opened first time with click
    FirebaseMessaging.onMessageOpenedApp.listen(navigate);

    /// check when app is in foreground
    FirebaseMessaging.onMessage.listen(navigate);
  }

  static void requestPermissionsLocalNotification() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> setupFirebaseConfig() async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.

    await Firebase.initializeApp();

    /// Background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    /// Permission
    await FirebaseMessaging.instance.requestPermission();

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      // onDidReceiveLocalNotification: (
      //   int id,
      //   String? title,
      //   String? body,
      //   String? payload,
      // ) async {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsIOS,
    );
    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse payload) async {
          if (payload.payload?.isNotEmpty ?? false) {
            onRecieveNotification(
              RemoteMessage.fromMap(
                json.decode(payload.payload ?? "") as Map<String, dynamic>,
              ),
            );
            print(json.decode(payload.payload ?? ""));
          }
        },
      );
    } catch (e) {
      // Logger.printWarning(e.toString());
    }
  }

  static Future<void> onRecieveNotification(RemoteMessage message) async {
    if (message.notification == null) return;

    /// switch case
    await showNotification(message, message.notification!);
  }

  static Future<void> showNotification(
    RemoteMessage message,
    RemoteNotification notification,
  ) async {
    // if (Platform.isIOS) return;
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      icon: "mipmap/ic_launcher",
      fullScreenIntent: true,
      ticker: 'ticker',
      playSound: false,
    );

    const DarwinNotificationDetails iOSNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      threadIdentifier: "thread3",

      // attachments: <DarwinNotificationAttachment>[
      //   DarwinNotificationAttachment('assets/logos/wndo_logo_ios.png')
      // ],
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      6,
      notification.title ?? '',
      notification.body,
      platformChannelSpecifics,
    );
  }

  static Future<void> navigate(RemoteMessage? message) async {
    await Future.delayed(const Duration(seconds: 3));

    if (message?.notification == null) return;
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        threadIdentifier: "thread3",
      ),
    );
  }

  Future<void> showLocalNotification({
    int id = 6,
    String? title,
    String? body,
    String? payload,
  }) async {
    return FlutterLocalNotificationsPlugin()
        .show(id, title, body, notificationDetails());
  }
}

// /// TOP-LEVEL FUNCTION
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  try {
    FirebaseMessagingProvider.navigate(message);
  } catch (e) {
    // Logger.printWarning(e.toString());
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
}
