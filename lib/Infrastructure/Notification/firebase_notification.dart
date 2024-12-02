// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/UI/Screens/SettingSection/Widget/setting_card.dart';

class InstaSaveNotification {
  getNotificationReq(requestPermission) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final intercomToken = await messaging.getToken();
    if (intercomToken != null) {
      messaging.getInitialMessage().then((RemoteMessage? message) {
        if (message != null) {
          firebaseMessagingOnMessageHandler(message);
        }
      });
   //NotificationSettings settings = await requestPermission();
      // messaging.setForegroundNotificationPresentationOptions(
      //   alert: true,
      //   badge: true,
      //   sound: true,
      // );
      //
      // NotificationSettings settings = await messaging.requestPermission(
      //   alert: true,
      //   announcement: false,
      //   badge: true,
      //   carPlay: false,
      //   criticalAlert: false,
      //   provisional: false,
      //   sound: true,
      // );
      //log('User granted permission: ${settings.authorizationStatus}');
      FirebaseMessaging.onMessageOpenedApp.listen(
        firebaseMessagingOnMessageHandler,
      );
      FirebaseMessaging.onMessage.listen(
        _firebaseMessagingOnMessageHandlerOne,
      );
      FirebaseMessaging.onBackgroundMessage(
        firebaseMessagingOnMessageHandler,
      );
    }
  }

  Future<void> _firebaseMessagingOnMessageHandlerOne(
      RemoteMessage message,
      ) async {
    await Firebase.initializeApp();
    ReceivedAction? initialAction;

    AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              onlyAlertOnce: true,
              channelGroupKey: 'InstaSave',
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: ColorConstants.purple,
              ledColor: ColorConstants.purple)
        ],
        debug: true);

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);

    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    //ßif (!isAllowed) return;
    if (notification != null && android != null) {
      await AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: notification.hashCode,
              channelKey: 'alerts',
              title: notification.title,
              body: notification.body,
              bigPicture: notification.android?.imageUrl,
              largeIcon: notification.android?.imageUrl,
              notificationLayout: NotificationLayout.BigPicture,
              payload: {'notificationId': '1234567890'}),

          actionButtons: [
            NotificationActionButton(key: 'REDIRECT', label: 'Watch'),
            NotificationActionButton(
                key: 'DISMISS',
                label: 'Dismiss',
                actionType: ActionType.DismissAction,
                isDangerousOption: true)
          ]);
    } else {
      notification!.printError();
    }

    log("Handling a foreground message");
  }
}

Future<void> firebaseMessagingOnMessageHandler(
    RemoteMessage message,
    ) async {
  await Firebase.initializeApp();
  BuildContext? context = SettingCard.navigatorKey.currentContext;

  log('A new onMessageOpenedApp event was published!');
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    showDialog(
        context: context!,
        builder: (_) {
          return AlertDialog(
            title: Text(notification.title!),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body!),
                ],
              ),
            ),
          );
        });
  }
  log("Handling a background message");
}