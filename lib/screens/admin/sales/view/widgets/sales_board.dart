import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/sales_controller.dart';

class SalesBoard extends StatelessWidget {
  const SalesBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SalesController>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        AppText(
                          text: controller.itemSold.value,
                          size: 20,
                          fontColor: AppColors.highDeepBlue,
                        ),
                        const AppText(
                          text: "Item Sold",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Rs: ${controller.earned.value}.00",
                          size: 20,
                          fontColor: AppColors.highDeepBlue,
                        ),
                        const AppText(
                          text: "Earned",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: [
                        AppText(
                          text: controller.orders.value,
                          size: 20,
                          fontColor: AppColors.highDeepBlue,
                        ),
                        const AppText(
                          text: "Total Orders",
                          fontColor: AppColors.highDeepBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.pending.value,
                          size: 20,
                          fontColor: Colors.orangeAccent,
                        ),
                        const AppText(
                          text: "Pending",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.accept.value,
                          size: 20,
                          fontColor: Colors.orangeAccent,
                        ),
                        const AppText(
                          text: "Accept",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.processing.value,
                          size: 20,
                          fontColor: Colors.orangeAccent,
                        ),
                        const AppText(
                          text: "Processing",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.delivered.value,
                          size: 20,
                          fontColor: Colors.orangeAccent,
                        ),
                        const AppText(
                          text: "Delivered",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.complete.value,
                          size: 20,
                          fontColor: AppColors.green26,
                        ),
                        const AppText(
                          text: "Completed",
                          fontColor: AppColors.green26,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        AppText(
                          text: controller.totalStock.value,
                          size: 20,
                          fontColor: AppColors.highDeepBlue,
                        ),
                        const AppText(
                          text: "Total Products",
                          fontColor: AppColors.highDeepBlue,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.outStock.value,
                          size: 20,
                          fontColor: Colors.orangeAccent,
                        ),
                        const AppText(
                          text: "Products out of stock",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        AppText(
                          text: controller.customers.value,
                          size: 20,
                          fontColor: AppColors.highDeepBlue,
                        ),
                        const AppText(
                          text: "Total Customers",
                          fontColor: AppColors.highDeepBlue,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: controller.employees.value,
                          size: 20,
                          fontColor: AppColors.highDeepBlue,
                        ),
                        const AppText(
                          text: "Employees",
                          fontColor: AppColors.highDeepBlue,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
