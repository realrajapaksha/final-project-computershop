import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_item_details_controller.dart';

class OrderItemDetails extends StatefulWidget {
  const OrderItemDetails({super.key});

  @override
  State<OrderItemDetails> createState() => _OrderItemDetailsState();
}

class _OrderItemDetailsState extends State<OrderItemDetails> {
  final controller = Get.put(OrderItemDetailsController());

  @override
  void initState() {
    super.initState();
    //controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<OrderItemDetailsController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
