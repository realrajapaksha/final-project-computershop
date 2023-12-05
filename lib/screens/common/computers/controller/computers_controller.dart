import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';
import '../../../../services/api_services/remote_service.dart';

class ComputerController extends GetxController {
  final computerList = <DashboardItemModel>[].obs;
  final priceSort = 0.obs;
  final nameSort = 0.obs;

  final loading = false.obs;

  final db = FirebaseFirestore.instance;

  initialize() async {
    try {
      loading.value = true;
      await getComputers();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getComputers() async {
    try {
      computerList.clear();

      await db
          .collection("products")
          .where("category", isEqualTo: "Computer")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            computerList.add(DashboardItemModel(
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
      computerList.shuffle();
    } catch (exception) {
      print(exception);
    }
  }

  searchComputers(String search) async {
    try {
      loading.value = true;
      final aiResult = await RemoteService.connectAI(search: search.trim());
      if (aiResult == null) {
        loading.value = false;
        return;
      }

      String filterString = "";
      if (aiResult == "computer 1") {
        filterString = "Low";
      } else if (aiResult == "computer 2") {
        filterString = "Middle";
      } else if (aiResult == "computer 3") {
        filterString = "High";
      } else if (aiResult == "computer 4") {
        filterString = "Special";
      }

      if (filterString == "") {
        loading.value = false;
        initialize();
        return;
      }

      computerList.clear();
      await db
          .collection("products")
          .where("category", isEqualTo: "Computer")
          .where("tags", isEqualTo: filterString)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            computerList.add(DashboardItemModel(
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
      computerList.shuffle();
      if(nameSort.value != 0){
        sortNameList();
      }else{
        sortPriceList();
      }

      loading.value = false;
    } catch (exception) {
      loading.value = false;
      print(exception);
    }
  }

  sortPriceList() {
    nameSort.value = 0;
    if (priceSort.value == 1) {
      // low top
      computerList.sort((a, b) => a.price.compareTo(b.price));
    } else if (priceSort.value == 2) {
      // high top
      computerList.sort((b, a) => a.price.compareTo(b.price));
    } else {
      computerList.shuffle();
    }
  }

  sortNameList() {
    priceSort.value = 0;
    if (nameSort.value == 1) {
      // low top
      computerList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (nameSort.value == 2) {
      // high top
      computerList
          .sort((b, a) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else {
      computerList.shuffle();
    }
  }
}
