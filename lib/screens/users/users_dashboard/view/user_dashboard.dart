import 'package:computershop/screens/users/user_home/view/widgets/bottom_nav.dart';
import 'package:computershop/screens/users/users_dashboard/view/widgets/item_card.dart';
import 'package:computershop/screens/users/user_home/view/widgets/user_dashboard_header.dart';
import 'package:computershop/utils/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/user_dashboard_controller.dart';

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
    return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: RefreshIndicator(
                  onRefresh: () => dashboardController.initialize(),
                  child: Obx(
                    () => Column(
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
                                onTap: () {},
                                child: const AppText(
                                  text: "See More  ",
                                  fontColor: AppColors.deepBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
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
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
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
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  dashboardController.accessories.length,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                    model: dashboardController
                                        .accessories[index]);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  }
}
