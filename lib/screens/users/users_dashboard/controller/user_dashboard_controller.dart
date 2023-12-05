import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../models/data_models/dashboard_item_model.dart';
import '../../../../services/other_services/fcm_notification_service.dart';
import '../../../../utils/shared_values.dart';

class UserDashboardController extends GetxController {
  final name = SharedValues.shared.username.obs;

  final computers = <DashboardItemModel>[].obs;
  final phones = <DashboardItemModel>[].obs;
  final accessories = <DashboardItemModel>[].obs;

  final db = FirebaseFirestore.instance;

  final computerLoad = false.obs;
  final phonesLoad = false.obs;
  final accessLoad = false.obs;

  initialize() async {
    getComputers();
    getPhones();
    getAccessories();

    FCMService().initialize();
  }

  getComputers() async {
    try {
      computerLoad.value = true;
      computers.clear();

      await db
          .collection("products")
          .where("category", isEqualTo: "Computer")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            computers.add(DashboardItemModel(
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
      computers.shuffle();
      computers.value = computers.take(5).toList();
      computerLoad.value = false;
    } catch (exception) {
      computerLoad.value = false;
    }
  }

  getPhones() async {
    try {
      phonesLoad.value = true;
      phones.clear();

      await db
          .collection("products")
          .where("category", isEqualTo: "Phone")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            phones.add(DashboardItemModel(
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
      phones.shuffle();
      phones.value = phones.take(5).toList();
      phonesLoad.value = false;
    } catch (exception) {
      phonesLoad.value = false;
    }
  }

  getAccessories() async {
    try {
      accessLoad.value = true;
      accessories.clear();

      await db
          .collection("products")
          .where("category", isEqualTo: "Accessories")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var item in value.docs) {
            accessories.add(DashboardItemModel(
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
      accessories.shuffle();
      accessories.value = accessories.take(5).toList();
      accessLoad.value = false;
    } catch (exception) {
      accessLoad.value = false;
    }
  }
}
