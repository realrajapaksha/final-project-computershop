import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_button.dart';
import '../controller/add_item_controller.dart';
import 'widgets/add_product_form.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final controller = Get.put(AddItemController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<AddItemController>();
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
                  const AddProductForm(),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    title: 'Add',
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
