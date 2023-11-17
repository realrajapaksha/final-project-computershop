import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/apps_alert.dart';
import '../controller/profile_controller.dart';
import 'widgets/profile_form.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<ProfileController>();
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
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Profile"),
          actions: [
            IconButton(
              color: Colors.red,
              onPressed: () async {
                final res = await AppsAlerts().openDialog(
                    context, "Log out", "Are you sure to log out?",
                    btnYN: true);
                if (res) {
                  controller.logOut(context);
                }
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Obx(() => controller.loading.value
                    ? const Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white,
                          radius: 15,
                        ),
                      )
                    : const ProfileForm())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
