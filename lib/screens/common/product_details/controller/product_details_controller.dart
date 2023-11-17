import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/cart_model.dart';
import '../../../../models/data_models/product_model.dart';
import '../../../../models/data_models/watchlist_model.dart';
import '../../../../models/navigate_models/product_nav_model.dart';
import '../../../../utils/shared_values.dart';
import '../../../../utils/widgets/apps_alert.dart';

class ProductDetailsController extends GetxController {
  final product = ProductModel(
          productId: "2342",
          pname: "[]",
          quantity: 0,
          price: 0,
          description: "[]",
          tags: "[]",
          image: "",
          category: "[]")
      .obs;
  final loading = false.obs;

  final isCart = false.obs;
  final isWatch = false.obs;

  final email = SharedValues.shared.email.obs;

  final db = FirebaseFirestore.instance;

  late ProductNavModel navModel;

  initialize(ProductNavModel nav) async {
    try {
      navModel = nav;
      loading.value = true;
      await getProductDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getProductDetails() async {
    try {
      await db
          .collection("products")
          .doc(navModel.productId)
          .get()
          .then((value) async {
        if (value.exists) {
          product.value = ProductModel(
              productId: value.id,
              pname: value["pname"],
              quantity: value["quantity"],
              price: value["price"],
              description: value["description"],
              tags: value["tags"],
              image: value["image"],
              category: value["category"]);

          await db
              .collection("cart")
              .where("productId", isEqualTo: product.value.productId)
              .where("userId", isEqualTo: email.value)
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              isCart.value = true;
            } else {
              isCart.value = false;
            }
          });

          await db
              .collection("watchlist")
              .where("productId", isEqualTo: product.value.productId)
              .where("userId", isEqualTo: email.value)
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              isWatch.value = true;
            } else {
              isWatch.value = false;
            }
          });
        }
      });
    } catch (exception) {
      print(exception);
    }
  }

  addCart(context) async {
    if (isCart.value) {
      return;
    }
    try {
      await AppsAlerts().openLoading(context, "Adding to Cart");

      final model = CartModel(
          cartId: '',
          productId: product.value.productId,
          userId: email.value,
          date: DateTime.now().millisecondsSinceEpoch,
          pname: "",
          price: 0,
          aunits: 0,
          image: "");
      await db.collection("cart").add(model.toAddFireStore()).then((value) {});
      getProductDetails();
      await AppsAlerts.closeAllDialogs(context);
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
    }
  }

  addWatchlist(context) async {
    if (isWatch.value) {
      return;
    }
    try {
      await AppsAlerts().openLoading(context, "Adding to watchlist");

      final model = WatchlistModel(
          productId: product.value.productId,
          userId: email.value,
          date: DateTime.now().millisecondsSinceEpoch,
          pname: "",
          price: 0,
          image: "",
          watchId: '');
      await db
          .collection("watchlist")
          .add(model.toAddFireStore())
          .then((value) {});
      getProductDetails();
      await AppsAlerts.closeAllDialogs(context);
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
    }
  }

  report(context) async {
    try {} catch (exception) {
      //
    }
  }
}
