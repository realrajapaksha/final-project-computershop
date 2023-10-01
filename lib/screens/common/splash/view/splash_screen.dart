import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController =
  Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    splashController.delaySplash(context);
  }

  @override
  void dispose() {
    Get.delete<SplashController>();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/logo-white.svg",
                        width: 40, height: 40, fit: BoxFit.cover),
                  ],
                ),
                const AppText(
                  text: "Event Management",
                  size: 16,
                  weight: FontWeight.w400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
