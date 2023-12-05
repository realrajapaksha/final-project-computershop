import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../utils/shared_values.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // for android
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    // for ios
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestSoundPermission: true,
            requestBadgePermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails("com.peterson.emg", "events",
            groupKey: "com.peterson.emg"),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(String title, String body, bool isBackground) async {
    await SharedValues.shared.getInstance();
    try {
      if (!isBackground) {
        int id = SharedValues.shared.notificationId;
        SharedValues.shared.setNotificationId(id + 1);

        return notificationsPlugin.show(
            id, title, body, await notificationDetails());
      }
    } catch (exception) {
      //
    }
  }
}