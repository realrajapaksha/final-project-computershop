import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/api_models/order_model.dart';
import '../../../../utils/shared_values.dart';

class OrderItemsController extends GetxController {
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
            .where("userId", isEqualTo: email.value)
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
                        .doc(item["productId"])
                        .get()
                        .then((value) {
                      if (value.exists) {
                        final model = OrderModel(
                            orderId: doc.id,
                            paymentId: doc["paymentId"],
                            userId: doc["userId"],
                            name: doc["name"],
                            paymentMethod: doc["paymentMethod"],
                            status: doc["status"],
                            address: doc["address"],
                            city: doc["city"],
                            date: doc["date"],
                            note: doc["note"],
                            tele1: doc["tele1"],
                            tele2: doc["tele2"],
                            productId: item["productId"],
                            pname: value["pname"],
                            quantity: item["quantity"],
                            image: value["image"],
                            price: value["price"]);

                        orderList.add(model);
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
