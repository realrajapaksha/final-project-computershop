import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/cart_controller.dart';
import 'widgets/cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final controller = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<CartController>();
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
        child: Obx(
          () => Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              foregroundColor: Colors.white,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text("Cart"),
              actions: [
                controller.cardList.isNotEmpty
                    ? TextButton(
                        onPressed: () {
                          controller.checkOut(context);
                        },
                        child: const Text("Checkout"))
                    : const SizedBox()
              ],
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
                            itemCount: controller.cardList.length,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CartItem(cart: controller.cardList[index]);
                            }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
