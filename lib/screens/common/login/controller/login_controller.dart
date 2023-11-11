import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../models/navigate_models/register_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../services/api_services/remote_service.dart';
import '../../../../utils/shared_values.dart';

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
      SharedValues.shared.setUsername("Induwra Rajapaksha");
      final res = true;// await RemoteService.checkUser(email: account.email);

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
        await _googleSignIn.disconnect();
      }
    } catch (exception) {
      // error
    }
  }

  routeToRegister(context, account) async {
    await Navigator.pushNamed(context, AppRoute.register,
        arguments: RegisterNavModel(account: account));
    await _googleSignIn.disconnect();
  }

  routeToHome(context) {
    Navigator.popAndPushNamed(context, AppRoute.userHome);
  }
}
