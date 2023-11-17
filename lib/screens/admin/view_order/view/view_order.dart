import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/api_models/order_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/view_order_controller.dart';

class ViewOrder extends StatefulWidget {
  final OrderModel order;

  const ViewOrder({super.key, required this.order});

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  final controller = Get.put(ViewOrderController());

  final statusList = ["Pending", "Accept", "Processing", "Delivered", "Picked"];

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.order);
  }

  @override
  void dispose() {
    Get.delete<ViewOrderController>();
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Order Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Hero(
                    tag: widget.order.image,
                    child: CachedNetworkImage(
                      imageUrl: widget.order.image,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Product",
                            size: 14,
                          ),
                          AppText(
                            text: "Order ID",
                            size: 14,
                          ),
                          AppText(
                            text: "Date",
                            size: 14,
                          ),
                          AppText(
                            text: "Total",
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: ": ${widget.order.pname}",
                            size: 14,
                          ),
                          AppText(
                            text: ": ${widget.order.orderId}",
                            size: 14,
                          ),
                          AppText(
                            text:
                                ": ${DateFormat("yyyy-MM-dd").format(DateTime.fromMillisecondsSinceEpoch(widget.order.date))}",
                            size: 14,
                          ),
                          AppText(
                            text:
                                ": Rs. ${widget.order.price} x ${widget.order.quantity} = Rs. ${widget.order.quantity * widget.order.price}/=",
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const AppText(text: "Change Order Status"),
              const SizedBox(
                height: 2,
              ),
              Obx(
                () => Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      icon: const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.white,
                      ),
                      dropdownColor: AppColors.highDeepBlue,
                      value: controller.selectedStatus.value,
                      items: statusList.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: AppText(
                              size: 14,
                              text: item.toString(),
                              fontColor: AppColors.white,
                              overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.selectedStatus.value = newValue;
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.highDeepBlue,
                ),
                child: InkWell(
                  onTap: () {
                    controller.updateStatus(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Update Status",
                          align: TextAlign.center,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
