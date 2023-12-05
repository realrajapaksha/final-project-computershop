import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../firebase_options.dart';
import '../../main.dart';
import '../../utils/shared_values.dart';
import 'notification_service.dart';

class FCMService {
  final firebaseMessaging = FirebaseMessaging.instance;
  final db = FirebaseFirestore.instance;

  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await firebaseMessaging.requestPermission();
    final token = await firebaseMessaging.getToken();
    if (token != null) {
      print(SharedValues.shared.type);
      await updateFireStoreToken(token);
      await FirebaseMessaging.instance
          .subscribeToTopic(SharedValues.shared.type);
    }

    initPushNotification();
  }

  Future<void> updateFireStoreToken(String token) async {
    try {
      var data = {"email": SharedValues.shared.email.trim(), "token": token};

      await db
          .collection("fcmTokens")
          .doc(SharedValues.shared.email)
          .set(data)
          .then((value) {});
    } catch (exception) {
      //
    }
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  void handleMessage(RemoteMessage? message) async {
    if (message == null || message.notification == null) {
      return;
    }

    if (message.notification?.title == null ||
        message.notification?.body == null) {
      return;
    }

    NotificationService().showNotification(
        message.notification!.title!, message.notification!.body!, false);
  }
}
