import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';

class PhoneController extends GetxController {
  final priceSort = 0.obs;
  final nameSort = 0.obs;

  final phonesList = <DashboardItemModel>[].obs;
  final filteredList = <DashboardItemModel>[].obs;
  final loading = false.obs;
  final db = FirebaseFirestore.instance;

  initialize() async {
    try {
      loading.value = true;
      await getPhones();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getPhones() async {
    try {
      phonesList.clear();

      await db
          .collection("products")
          .where("category", isEqualTo: "Phone")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            phonesList.add(DashboardItemModel(
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
      phonesList.shuffle();
    } catch (exception) {
      print(exception);
    }
  }

  searchPhones(String search) async {
    priceSort.value = 0;
    nameSort.value = 0;
    try {
      filteredList.value =
          phonesList.where((p0) => p0.name.toLowerCase().startsWith(search.toLowerCase())).toList();
    } catch (exception) {
      print(exception);
    }
  }

  sortPriceList() {
    nameSort.value = 0;
    if (priceSort.value == 1) {
      // low top
      phonesList.sort((a, b) => a.price.compareTo(b.price));
    } else if (priceSort.value == 2) {
      // high top
      phonesList.sort((b, a) => a.price.compareTo(b.price));
    } else {
      phonesList.shuffle();
    }
  }

  sortNameList() {
    priceSort.value = 0;
    if (nameSort.value == 1) {
      // low top
      phonesList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (nameSort.value == 2) {
      // high top
      phonesList
          .sort((b, a) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else {
      phonesList.shuffle();
    }
  }
}
