import 'package:flutter/material.dart';

import 'app_alert_loading.dart';
import 'app_alert_show.dart';

class AppsAlerts {
  Future<void> openLoading(BuildContext context, String message) async {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          return AppAlertLoading(a1: a1, a2: a2, message: message);
        });
  }

  Future<bool> openDialog(BuildContext context, String title, String message,
      {bool btnYN = false,
      bool isWarning = false,
      bool dismiss = false}) async {
    final result = await showGeneralDialog(
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          return AppAlertShow(
              a1: a1,
              a2: a2,
              title: title,
              message: message,
              btnYN: btnYN,
              isWarning: isWarning,
              dismiss: dismiss);
        });

    if (result != null && result is bool) {
      return result;
    } else {
      return false;
    }
  }

  //close all alerts
  static closeAllDialogs(context) async {
    Navigator.pop(context);
  }
}
