import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../admin_dashboard/view/admin_dashboard.dart';
import '../../admin_menu/view/admin_menu.dart';
import '../../orders_list/view/order_list.dart';
import '../../sales/view/sales_list.dart';
import '../controller/admin_home_controller.dart';
import 'widgets/bottom_nav.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final homeController = Get.put(AdminHomeController());

  static const menuItem = [AdminDashboard(), OrderList(), Sales(), AdminMenu()];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<AdminHomeController>();
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
