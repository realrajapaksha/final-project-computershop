import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/watchlist_model.dart';
import '../../../../utils/shared_values.dart';

class WatchlistController extends GetxController {
  final watchList = <WatchlistModel>[].obs;

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
      watchList.clear();
      await db
          .collection("watchlist")
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
                final model = WatchlistModel(
                    watchId: item.id,
                    productId: item["productId"],
                    userId: item["userId"],
                    date: item["date"],
                    pname: res["pname"],
                    price: res["price"],
                    image: res["image"]);
                watchList.add(model);
              }
            });
          }
        }
      });
      watchList.sort((b, a) => a.date.compareTo(b.date));
    } catch (exception) {
      print(exception);
    }
  }

  deleteCartItem(context, String id) async {
    try {
      await db.collection("watchlist").doc(id).delete().then((value) {
        initialize();
      });
    } catch (exception) {
      initialize();
    }
  }
}