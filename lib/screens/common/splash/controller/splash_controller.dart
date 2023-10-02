import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../routes/app_route.dart';
import '../../../../utils/shared_values.dart';

class SplashController extends GetxController {
  final isRetry = false.obs;

  Future<void> delaySplash(context) async {
    Future.delayed(const Duration(seconds: 2), () async {
      try {
        bool internet = await InternetConnectionChecker().hasConnection;
        if (internet == true) {
          if (SharedValues.shared.isSignedIn) {
            Navigator.popAndPushNamed(context, AppRoute.userDashboard);
          } else {
            Navigator.pushNamed(context, AppRoute.login);
          }
        }
      } catch (e) {
        isRetry.value = true;
      }
    });
  }
}
