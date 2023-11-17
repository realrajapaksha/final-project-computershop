import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../models/api_models/order_model.dart';
import '../../../../../routes/app_route.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/order_list_controller.dart';

class OrderItemAdmin extends StatelessWidget {
  final OrderModel order;

  const OrderItemAdmin({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderListController>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              await Navigator.pushNamed(context, AppRoute.viewOrder,
                  arguments: order);
              controller.initialize();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: Row(

                children: [
                  CachedNetworkImage(
                    imageUrl: order.image,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: order.pname,
                              size: 16,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AppText(text: "#Order ID: ${order.orderId}"),
                            const SizedBox(
                              height: 5,
                            ),
                            AppText(text: "Status: ${order.status}"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(
                                text: DateFormat("yyyy-MM-dd").format(
                                    DateTime.fromMillisecondsSinceEpoch(order.date))),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                AppText(
                                  text: "x ${order.quantity}",
                                  size: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
