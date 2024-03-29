import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../models/api_models/order_model.dart';
import '../../../../models/navigate_models/product_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/order_item_details_controller.dart';
import 'widgets/order_status_item.dart';

class OrderItemDetails extends StatefulWidget {
  final OrderModel order;

  const OrderItemDetails({super.key, required this.order});

  @override
  State<OrderItemDetails> createState() => _OrderItemDetailsState();
}

class _OrderItemDetailsState extends State<OrderItemDetails> {
  final controller = Get.put(OrderItemDetailsController());
  bool pending = false;
  bool accept = false;
  bool processing = false;
  bool delivery = false;
  bool picked = false;

  @override
  void initState() {
    super.initState();

    String status = widget.order.status.toLowerCase();
    if (status == "pending") {
      pending = true;
    } else if (status == "accept") {
      pending = true;
      accept = true;
    } else if (status == "processing") {
      pending = true;
      accept = true;
      processing = true;
    } else if (status == "delivered") {
      pending = true;
      accept = true;
      processing = true;
      delivery = true;
    } else if (status == "picked") {
      pending = true;
      accept = true;
      processing = true;
      delivery = true;
      picked = true;
    }

    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<OrderItemDetailsController>();
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
          title: const Text("Order Status"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimelineTile(
                  isFirst: true,
                  alignment: TimelineAlign.start,
                  afterLineStyle: LineStyle(
                    color: accept ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  endChild: OrderStatusItem(
                      title: 'Pending',
                      icon: Icons.work_history_outlined,
                      done: pending),
                  indicatorStyle: IndicatorStyle(
                    iconStyle: IconStyle(
                        iconData: pending ? Icons.done : Icons.pending,
                        fontSize: 20,
                        color: AppColors.white),
                    color: pending ? Colors.deepOrangeAccent : Colors.white,
                    width: 22,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.start,
                  beforeLineStyle: LineStyle(
                    color: accept ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  afterLineStyle: LineStyle(
                    color: processing ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  endChild: OrderStatusItem(
                      title: 'Accept',
                      icon: Icons.fact_check_outlined,
                      done: accept),
                  indicatorStyle: IndicatorStyle(
                    iconStyle: IconStyle(
                        iconData: accept ? Icons.done : Icons.pending,
                        fontSize: 20,
                        color: AppColors.white),
                    color: accept ? Colors.deepOrangeAccent : Colors.white,
                    width: 22,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.start,
                  beforeLineStyle: LineStyle(
                    color: processing ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  afterLineStyle: LineStyle(
                    color: delivery ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  endChild: OrderStatusItem(
                      title: 'Processing',
                      icon: Icons.inventory_2_outlined,
                      done: processing),
                  indicatorStyle: IndicatorStyle(
                    iconStyle: IconStyle(
                        iconData: processing ? Icons.done : Icons.pending,
                        fontSize: 20,
                        color: AppColors.white),
                    color: processing ? Colors.deepOrangeAccent : Colors.white,
                    width: 22,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.start,
                  beforeLineStyle: LineStyle(
                    color: delivery ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  afterLineStyle: LineStyle(
                    color: picked ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  endChild: OrderStatusItem(
                      title: 'Delivered',
                      icon: Icons.local_shipping_outlined,
                      done: delivery),
                  indicatorStyle: IndicatorStyle(
                    iconStyle: IconStyle(
                        iconData: delivery ? Icons.done : Icons.pending,
                        fontSize: 20,
                        color: AppColors.white),
                    color: delivery ? Colors.deepOrangeAccent : Colors.white,
                    width: 22,
                  ),
                ),
                TimelineTile(
                  isLast: true,
                  alignment: TimelineAlign.start,
                  beforeLineStyle: LineStyle(
                    color: picked ? Colors.deepOrangeAccent : Colors.white,
                  ),
                  endChild: OrderStatusItem(
                      title: 'Picked',
                      icon: Icons.inventory_rounded,
                      done: picked),
                  indicatorStyle: IndicatorStyle(
                    iconStyle: IconStyle(
                        iconData: picked ? Icons.done : Icons.pending,
                        fontSize: 20,
                        color: AppColors.white),
                    color: picked ? Colors.deepOrangeAccent : Colors.white,
                    width: 22,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
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
                              text: "Payment ID",
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
                              text: ": ${widget.order.paymentId}",
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
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                              text: "Name",
                              size: 14,
                            ),
                            AppText(
                              text: "Address",
                              size: 14,
                            ),
                            AppText(
                              text: "Pay method",
                              size: 14,
                            ),
                            AppText(
                              text: "Telephone",
                              size: 14,
                            ),
                            AppText(
                              text: "Note",
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
                              text: ": ${widget.order.name}",
                              size: 14,
                            ),
                            AppText(
                              text:
                                  ": ${widget.order.address}, ${widget.order.city}",
                              size: 14,
                            ),
                            AppText(
                              text: ": ${widget.order.paymentMethod}",
                              size: 14,
                            ),
                            AppText(
                              text:
                                  ": ${widget.order.tele1}, ${widget.order.tele2}",
                              size: 14,
                            ),
                            AppText(
                              text: ": ${widget.order.note}",
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.highDeepBlue,
                  ),
                  child: InkWell(
                    onTap: () {
                      final model = ProductNavModel(
                          productId: widget.order.productId,
                          image: widget.order.image);
                      Navigator.pushNamed(context, AppRoute.productDetails,
                          arguments: model);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: "View Product",
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
      ),
    );
  }
}
