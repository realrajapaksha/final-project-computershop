import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/api_models/order_model.dart';
import '../../../../utils/shared_values.dart';

class OrderListController extends GetxController {
  final orderList = <OrderModel>[].obs;

  final loading = false.obs;

  final email = SharedValues.shared.email.obs;

  final db = FirebaseFirestore.instance;

  initialize() async {
    try {
      loading.value = true;
      await getOrderDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getOrderDetails() async {
    try {
      orderList.clear();
      if (email.value.isNotEmpty) {
        await db
            .collection("orders")
            .get()
            .then((res) async {
          if (res.docs.isNotEmpty) {
            for (var doc in res.docs) {
              await db
                  .collection("order_products")
                  .where("orderId", isEqualTo: doc.id)
                  .get()
                  .then((orderProducts) async {
                if (orderProducts.docs.isNotEmpty) {
                  for (var item in orderProducts.docs) {
                    await db
                        .collection("products")
                        .where("productId", isEqualTo: item["productId"])
                        .get()
                        .then((value) {
                      if (value.docs.isNotEmpty) {
                        for (var product in value.docs) {
                          final model = OrderModel(
                              orderId: doc.id,
                              paymentId: doc["paymentId"],
                              userId: doc["userId"],
                              paymentMethod: doc["paymentMethod"],
                              status: doc["status"],
                              address: doc["address"],
                              city: doc["city"],
                              date: doc["date"],
                              note: doc["note"],
                              tele1: doc["tele1"],
                              tele2: doc["tele2"],
                              pname: product["pname"],
                              quantity: item["quantity"],
                              image: product["image"],
                              price: product["price"]);

                          orderList.add(model);
                        }
                      }
                    });
                  }
                }
              });
            }
          }
        });
      }
      orderList.sort((b, a) => a.date.compareTo(b.date));
    } catch (exception) {
      print(exception);
    }
  }
}