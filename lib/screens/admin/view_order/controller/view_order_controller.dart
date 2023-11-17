import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/api_models/order_model.dart';
import '../../../../utils/widgets/apps_alert.dart';

class ViewOrderController extends GetxController {
  final selectedStatus = "".obs;

  late OrderModel order;

  final db = FirebaseFirestore.instance;

  initialize(OrderModel navOrder) async {
    try {
      order = navOrder;
      selectedStatus.value = navOrder.status;
    } catch (exception) {
      //
    }
  }

  updateStatus(context) async {
    try {
      await AppsAlerts().openLoading(context, "Updating order status..");
      await db
          .collection("orders")
          .doc(order.orderId)
          .update({'status': selectedStatus.value}).then((value) {});
      await AppsAlerts.closeAllDialogs(context);
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
    }
  }
}
