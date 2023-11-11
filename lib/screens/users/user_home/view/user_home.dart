import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../cart/view/cart.dart';
import '../../order_items/view/order_items.dart';
import '../../users_dashboard/view/user_dashboard.dart';
import '../controller/user_home_controller.dart';
import 'widgets/bottom_nav.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final UserHomeController homeController = Get.put(UserHomeController());

  static const menuItem = [UserDashboard(), Cart(), OrderItems()];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<UserHomeController>();
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
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.transparent,
          body: menuItem[homeController.currentIndex.value],
          bottomNavigationBar: BottomNav(
            currentIndex: homeController.currentIndex.value,
            onTap: (index) {
              homeController.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
