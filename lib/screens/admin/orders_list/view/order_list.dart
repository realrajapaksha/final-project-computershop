import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/order_list_controller.dart';
import 'widgets/order_item_admin.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final controller = Get.put(OrderListController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<OrderListController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("Order List"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                      () => controller.loading.value
                      ? const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 15,
                    ),
                  )
                      : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.orderList.length,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return OrderItemAdmin(
                            order: controller.orderList[index]);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
