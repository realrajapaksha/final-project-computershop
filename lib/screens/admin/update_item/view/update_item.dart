import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_button.dart';
import '../controller/update_item_controller.dart';
import 'widgets/update_product_form.dart';

class UpdateItem extends StatefulWidget {
  final String productId;
  const UpdateItem({super.key, required this.productId});

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  final controller = Get.put(UpdateItemController());

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.productId);
  }

  @override
  void dispose() {
    Get.delete<UpdateItemController>();
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
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            centerTitle: true,
            title: const Text(
              "Add Product",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Column(
                children: [
                  const UpdateProductForm(),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    title: 'Update',
                    onTapped: () {
                      controller.addProduct(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
