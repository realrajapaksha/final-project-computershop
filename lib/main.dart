import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';
import 'routes/app_route.dart' as route;
import 'services/other_services/notification_service.dart';
import 'utils/app_colors.dart';
import 'utils/shared_values.dart';

// firebase background message handler
@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await SharedValues.shared.getInstance();
  if (message.notification == null) {
    return;
  }

  if (message.notification?.title == null ||
      message.notification?.body == null) {
    return;
  }

  await NotificationService().showNotification(
      message.notification!.title!, message.notification!.body!, true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.highDeepBlue));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SharedValues.shared.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey =
      "pk_test_51NSOXNEJSo66fUePKHTlFzKCDOv6dsiPq6YoUHdm8oLXggG754fdBGmsWsjebT8qVcNZLW6grc7TvKro83dJRaLu004jkefGt6";

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  await NotificationService().initNotification();

  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.AppRoute.splash,
    );
  }
}
