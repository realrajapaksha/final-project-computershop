import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/pay_product_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../../../../utils/widgets/app_text_field.dart';
import '../controller/payment_details_controller.dart';
import 'widgets/pay_product_item.dart';

class PaymentDetails extends StatefulWidget {
  final List<PayProductModel> productList;

  const PaymentDetails({super.key, required this.productList});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final controller = Get.put(PaymentDetailsController());

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.productList);
  }

  @override
  void dispose() {
    Get.delete<PaymentDetailsController>();
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
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: const Text("Payment Details"),
            actions: [
              TextButton(
                  onPressed: () {
                    controller.makePayment(context);
                  },
                  child: const Text("Pay"))
            ],
          ),
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: "Fill Delivery Details",
                            fontColor: AppColors.lowLightBlue,
                            weight: FontWeight.bold,
                            size: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                              labelText: "Name",
                              controller: controller.nameController,
                              isEmpty: controller.nameEmpty.value,
                              onValueChanged: (val) {
                                controller.nameEmpty.value = val;
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextField(
                              labelText: "Address",
                              controller: controller.addressController,
                              isEmpty: controller.addressEmpty.value,
                              onValueChanged: (val) {
                                controller.addressEmpty.value = val;
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextField(
                              labelText: "City",
                              controller: controller.cityController,
                              isEmpty: controller.cityEmpty.value,
                              onValueChanged: (val) {
                                controller.cityEmpty.value = val;
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextField(
                              labelText: "Telephone 1",
                              controller: controller.tele1Controller,
                              isEmpty: controller.tele1Empty.value,
                              onValueChanged: (val) {
                                controller.tele1Empty.value = val;
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextField(
                              labelText: "Telephone 2",
                              controller: controller.tele2Controller,
                              onValueChanged: (val) {}),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextField(
                              labelText: "Note",
                              controller: controller.noteController,
                              onValueChanged: (val) {}),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Ink(
                      decoration:
                          const BoxDecoration(color: AppColors.highDeepBlue),
                      child: InkWell(
                        onTap: () {
                          controller.makePayment(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: "Total Rs. ${controller.total.value}0",
                                size: 16,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text: "Product List (${controller.productList.length})",
                      fontColor: AppColors.lowLightBlue,
                      weight: FontWeight.bold,
                      size: 15,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: controller.productList.length,
                        itemBuilder: (context, index) {
                          return PayProductItem(
                            product: controller.productList[index],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
