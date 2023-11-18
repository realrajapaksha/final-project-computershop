import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';

class ComputerController extends GetxController {
  final computerList = <DashboardItemModel>[].obs;
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

      String aiResult = "Co";

      String filterString = "";
      if(aiResult == "computer 1"){
        filterString = "Low";
      }else if(aiResult == "computer 2"){
        filterString = "Middle";
      }else if(aiResult == "computer 3"){
        filterString = "High";
      }else if(aiResult == "computer 4"){
        filterString = "Special";
      }

      if(filterString == ""){
        initialize();
        return;
      }

      computerList.clear();
      await db
          .collection("products")
          .where("category", isEqualTo: "Computer")
          .where("tag", isEqualTo: filterString)
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
    } catch (exception) {
      print(exception);
    }
  }
}
