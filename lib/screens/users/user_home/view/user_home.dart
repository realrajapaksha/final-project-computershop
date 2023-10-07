import 'package:computershop/screens/users/buy_items/view/buy_items.dart';
import 'package:computershop/screens/users/cart/view/cart.dart';
import 'package:computershop/screens/users/user_home/view/widgets/bottom_nav.dart';
import 'package:computershop/screens/users/users_dashboard/view/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/user_home_controller.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final UserHomeController homeController = Get.put(UserHomeController());

  static const menuItem = [UserDashboard(), Cart(), BuyItems()];

  @override
  void initState() {
    super.initState();
    //dashboardController.initialize();
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
