import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/login_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(LoginController());

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.highDeepBlue,
              AppColors.deepBlue,
              AppColors.lowDeepBlue
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Hero(
            tag: "start",
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const AppText(
                  text: "WELCOME BACK",
                  fontColor: AppColors.white,
                  weight: FontWeight.w800,
                  align: TextAlign.center,
                  size: 20,
                ),
                const AppText(
                  text: "NANOTEK COMPUTER SOLUTIONS",
                  fontColor: AppColors.white,
                  weight: FontWeight.w400,
                  align: TextAlign.center,
                  size: 13,
                ),
                const SizedBox(
                  height: 40,
                ),
                SignInButton(
                  Buttons.Google,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    controller.login(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
