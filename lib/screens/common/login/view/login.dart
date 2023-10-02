import 'package:computershop/routes/app_route.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  width: 200,
                  height: 200,
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
                  height: 20,
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
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.userDashboard);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const AppText(
                              text: "Continue with Google",
                              fontColor: AppColors.deepBlue,
                              weight: FontWeight.w600,
                              align: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
