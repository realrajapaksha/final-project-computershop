import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computershop/screens/admin/admin_dashboard/view/admin_dashboard.dart';
import 'package:computershop/screens/users/user_home/view/user_home.dart';
import 'package:computershop/utils/widgets/apps_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../models/navigate_models/register_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../services/api_services/remote_service.dart';
import '../../../../utils/shared_values.dart';
import '../../../admin/admin_home/view/admin_home.dart';

class LoginController extends GetxController {
  final loading = false.obs;

  final db = FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  login(context) async {
    try {
      loading.value = true;

      final account = await _googleSignIn.signIn();
      if (account != null) {
        await checkAccount(context, account);
      }
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  checkAccount(context, GoogleSignInAccount account) async {
    try {
      await AppsAlerts().openLoading(context, "Checking your account");
      final res = await RemoteService.checkUser(email: account.email);

      if (res != null) {
        if (res) {
          SharedValues.shared.setEmail(account.email);
          SharedValues.shared.setSignedIn(true);
          await routeToHome(context);
        } else {
          await routeToRegister(context, account);
        }
      } else {
        // error connection api
        await AppsAlerts.closeAllDialogs(context);
        await _googleSignIn.disconnect();
      }
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
    }
  }

  routeToRegister(context, account) async {
    await Navigator.pushNamed(context, AppRoute.register,
        arguments: RegisterNavModel(account: account));
    await AppsAlerts.closeAllDialogs(context);
    await _googleSignIn.disconnect();
  }

  routeToHome(context) async {
    if (SharedValues.shared.type == "Employee") {
      if (SharedValues.shared.status == "Approved") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AdminHome()),
            (Route route) => false);
      } else {
        await AppsAlerts.closeAllDialogs(context);
        await AppsAlerts().openDialog(context, "Error!",
            "Your account not approved by admin. Please contact admin");
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const UserHome()),
          (Route route) => false);
    }
  }
}
