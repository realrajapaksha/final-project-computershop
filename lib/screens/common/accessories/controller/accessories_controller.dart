import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';

class AccessoriesController extends GetxController {
  final accessoriesList = <DashboardItemModel>[].obs;
  final filteredList = <DashboardItemModel>[].obs;
  final loading = false.obs;
  final db = FirebaseFirestore.instance;

  initialize() async {
    try {
      loading.value = true;
      await getAccessories();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getAccessories() async {
    try {
      accessoriesList.clear();

      await db
          .collection("products")
          .where("category", isEqualTo: "Accessories")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            accessoriesList.add(DashboardItemModel(
                id: item.id,
                name: item["pname"],
                category: item["category"],
                price: item["price"],
                description: item["description"],
                qty: item["quantity"],
                image: item["image"]));
          }
        }
      });
      accessoriesList.shuffle();
    } catch (exception) {
      print(exception);
    }
  }

  searchAccessories(String search) async {
    try {
      filteredList.value =
          accessoriesList.where((p0) => p0.name.toLowerCase().startsWith(search.toLowerCase())).toList();
    } catch (exception) {
      print(exception);
    }
  }
}
