import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';

class AccessoriesController extends GetxController {
  final priceSort = 0.obs;
  final nameSort = 0.obs;

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
    priceSort.value = 0;
    nameSort.value = 0;
    try {
      filteredList.value =
          accessoriesList.where((p0) => p0.name.toLowerCase().startsWith(search.toLowerCase())).toList();
    } catch (exception) {
      print(exception);
    }
  }

  sortPriceList() {
    nameSort.value = 0;
    if (priceSort.value == 1) {
      // low top
      accessoriesList.sort((a, b) => a.price.compareTo(b.price));
    } else if (priceSort.value == 2) {
      // high top
      accessoriesList.sort((b, a) => a.price.compareTo(b.price));
    } else {
      accessoriesList.shuffle();
    }
  }

  sortNameList() {
    priceSort.value = 0;
    if (nameSort.value == 1) {
      // low top
      accessoriesList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (nameSort.value == 2) {
      // high top
      accessoriesList
          .sort((b, a) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else {
      accessoriesList.shuffle();
    }
  }
}
