import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../routes/app_route.dart';
import '../../../../utils/shared_values.dart';

class SplashController extends GetxController {
  Future<void> delaySplash(context) async {
    Future.delayed(const Duration(seconds: 2), () async {
      try {
        bool internet = await InternetConnectionChecker().hasConnection;
        if (internet == true) {
          if (SharedValues.shared.isSignedIn) {
            if (SharedValues.shared.type == "Employee") {
              if (SharedValues.shared.status == "Approved") {
                Navigator.popAndPushNamed(context, AppRoute.adminDashboard);
              } else {
                Navigator.popAndPushNamed(context, AppRoute.login);
              }
            } else {
              Navigator.popAndPushNamed(context, AppRoute.userHome);
            }
          } else {
            Navigator.popAndPushNamed(context, AppRoute.login);
          }
        }
      } catch (e) {
        //
      }
    });
  }
}
