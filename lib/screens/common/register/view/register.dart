import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/navigate_models/register_nav_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_button.dart';
import '../controller/register_controller.dart';
import 'widgets/register_form.dart';

class Register extends StatefulWidget {
  final RegisterNavModel account;

  const Register({super.key, required this.account});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.account);
  }

  @override
  void dispose() {
    Get.delete<RegisterController>();
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
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              tooltip: "Back",
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            titleSpacing: 0,
            centerTitle: true,
            title: const Text(
              "Create Account",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Column(
                children: [
                  const RegisterForm(),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    title: 'Register',
                    onTapped: () {
                      controller.register(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
