import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/cart_model.dart';
import '../../../../utils/shared_values.dart';

class CartController extends GetxController {
  final cardList = <CartModel>[].obs;

  final loading = false.obs;

  final email = SharedValues.shared.email.obs;

  final db = FirebaseFirestore.instance;

  initialize() async {
    try {
      loading.value = true;
      await getCartDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getCartDetails() async {
    try {
      await db
          .collection("cart")
          .where("userId", isEqualTo: email.value)
          .get()
          .then((value) async {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            await db
                .collection("products")
                .doc(item["productId"])
                .get()
                .then((res) {
              if (res.exists) {
                final model = CartModel(
                    cartId: item.id,
                    productId: item["productId"],
                    userId: item["userId"],
                    date: item["date"],
                    pname: res["pname"],
                    price: res["price"],
                    aunits: res["quantity"],
                    image: res["image"]);
                cardList.add(model);
              }
            });
          }
        }
      });
      cardList.sort((b, a) => a.date.compareTo(b.date));
    } catch (exception) {
      print(exception);
    }
  }

  deleteCartItem(context, String id) async {
    try {
      await db.collection("cart").doc(id).delete().then((value) {
        initialize();
      });
    } catch (exception) {
      initialize();
    }
  }
}
