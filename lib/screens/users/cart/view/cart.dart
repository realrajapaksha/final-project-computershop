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
    return SafeArea(child: Container(
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
          title: const Text("Cart"),
          actions: [
            TextButton(onPressed: (){}, child: const Text("Checkout"))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index){
                    return CartItem();
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
