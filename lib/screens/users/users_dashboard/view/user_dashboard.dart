import 'package:computershop/utils/shared_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/user_dashboard_controller.dart';
import 'widgets/item_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final UserDashboardController dashboardController =
      Get.put(UserDashboardController());

  @override
  void initState() {
    super.initState();
    dashboardController.initialize();
  }

  @override
  void dispose() {
    Get.delete<UserDashboardController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo_white.png",
                          width: 150,
                          height: 50,
                        ),
                        IconButton(
                            splashRadius: 20,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: AppColors.white,
                            ))
                      ],
                    ),
                    const AppText(
                      text: "Hello",
                      size: 25,
                      weight: FontWeight.bold,
                    ),
                    AppText(
                      text: SharedValues.shared.username,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              text: " Computer",
                              fontColor: AppColors.deepBlue,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.payment);
                                },
                                child: const AppText(
                                  text: "See More  ",
                                  fontColor: AppColors.deepBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: dashboardController.computers.length,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                    model:
                                        dashboardController.computers[index]);
                              }),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              text: " Phones",
                              fontColor: AppColors.deepBlue,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: const AppText(
                                  text: "See More  ",
                                  fontColor: AppColors.deepBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: dashboardController.phones.length,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                    model: dashboardController.phones[index]);
                              }),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              text: " Accessories",
                              fontColor: AppColors.deepBlue,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: const AppText(
                                  text: "See More  ",
                                  fontColor: AppColors.deepBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: dashboardController.accessories.length,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                    model:
                                        dashboardController.accessories[index]);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
