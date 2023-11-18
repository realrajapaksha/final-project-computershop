import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/complain_view_model.dart';

class ComplainsController extends GetxController {
  final loading = false.obs;

  final complainList = <ComplainViewModel>[].obs;

  final db = FirebaseFirestore.instance;

  getComplainList() async {
    try {
      loading.value = true;
      complainList.clear();

      await db.collection("reports").get().then((value) async {
        for (var item in value.docs) {
          await db
              .collection("products")
              .doc(item["productId"])
              .get()
              .then((product) {
            final model = ComplainViewModel(
                reportId: item.id,
                pname: product["pname"],
                image: product["image"],
                productId: item["productId"],
                email: item["userId"],
                note: item["description"],
                date: item["date"]);

            complainList.add(model);
          });
        }
      });

      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }
}
