import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/order_items_controller.dart';
import 'widgets/order_item.dart';

class OrderItems extends StatefulWidget {
  const OrderItems({super.key});

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  final controller = Get.put(OrderItemsController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<OrderItemsController>();
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
            title: const Text("Purchase Items"),
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
                            return OrderItem(
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
