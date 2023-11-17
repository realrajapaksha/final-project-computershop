import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SalesController extends GetxController {
  final db = FirebaseFirestore.instance;

  final startDate = DateTime(DateTime.now().year, DateTime.now().month, 1)
      .millisecondsSinceEpoch
      .obs;
  final endDate = DateTime.now().millisecondsSinceEpoch.obs;

  final itemSold = "0".obs;
  final earned = "0".obs;

  final orders = "0".obs;
  final pending = "0".obs;
  final accept = "0".obs;
  final processing = "0".obs;
  final delivered = "0".obs;
  final complete = "0".obs;

  final totalStock = "0".obs;
  final outStock = "0".obs;
  final computers = "0".obs;
  final phones = "0".obs;
  final accessories = "0".obs;

  final customers = "0".obs;
  final employees = "0".obs;

  final loading = false.obs;

  initialize() async {
    try {
      loading.value = true;

      itemSold.value = "0";
      earned.value = "0";
      orders.value = "0";
      pending.value = "0";
      accept.value = "0";
      processing.value = "0";
      delivered.value = "0";
      complete.value = "0";
      totalStock.value = "0";
      outStock.value = "0";
      customers.value = "0";
      employees.value = "0";

      await getUsers();
      await getPayments();
      await getOrders();
      await getItems();
      await getStocks();

      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getPayments() async {
    try {
      await db
          .collection("payment")
          .where("date", isGreaterThanOrEqualTo: startDate.value)
          .where("date", isLessThanOrEqualTo: endDate.value)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var doc in value.docs) {
            earned.value = (int.parse(earned.value) + doc["total"]).toString();
          }
        } else {
          print("no");
        }
      });
    } catch (exception) {
      print(exception);
    }
  }

  getUsers() async {
    try {
      await db
          .collection("users")
          .where("type", isEqualTo: "Employee")
          .get()
          .then((value) {
        employees.value = value.docs.length.toString();
      });
      await db
          .collection("users")
          .where("type", isEqualTo: "Customer")
          .get()
          .then((value) {
        customers.value = value.docs.length.toString();
      });
    } catch (exception) {
      //
    }
  }

  getItems() async {
    try {
      await db
          .collection("order_products")
          .where("date", isGreaterThanOrEqualTo: startDate.value)
          .where("date", isLessThanOrEqualTo: endDate.value)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var doc in value.docs) {
            print(doc.id);
            itemSold.value =
                (int.parse(itemSold.value) + doc["quantity"]).toString();
          }
        }
      });
    } catch (exception) {
      print(exception);
    }
  }

  getOrders() async {
    try {
      await db
          .collection("orders")
          .where("date", isGreaterThanOrEqualTo: startDate.value)
          .where("date", isLessThanOrEqualTo: endDate.value)
          .get()
          .then((value) {
        orders.value = value.docs.length.toString();
      });
      await db
          .collection("orders")
          .where("status", isEqualTo: "Pending")
          .get()
          .then((value) {
        pending.value = value.docs.length.toString();
      });
      await db
          .collection("orders")
          .where("status", isEqualTo: "Accept")
          .get()
          .then((value) {
        accept.value = value.docs.length.toString();
      });
      await db
          .collection("orders")
          .where("status", isEqualTo: "Processing")
          .get()
          .then((value) {
        processing.value = value.docs.length.toString();
      });
      await db
          .collection("orders")
          .where("status", isEqualTo: "Delivered")
          .get()
          .then((value) {
        delivered.value = value.docs.length.toString();
      });
      await db
          .collection("orders")
          .where("status", isEqualTo: "Picked")
          .get()
          .then((value) {
        complete.value = value.docs.length.toString();
      });
    } catch (exception) {
      //
    }
  }

  getStocks() async {
    try {
      await db
          .collection("products")
          .where("quantity", isEqualTo: 0)
          .get()
          .then((value) {
        outStock.value = value.docs.length.toString();
      });

      await db.collection("products").get().then((value) {
        totalStock.value = value.docs.length.toString();
      });

      await db
          .collection("products")
          .where("category", isEqualTo: "Computer")
          .get()
          .then((value) {
        computers.value = value.docs.length.toString();
      });

      await db
          .collection("products")
          .where("category", isEqualTo: "Phone")
          .get()
          .then((value) {
        phones.value = value.docs.length.toString();
      });

      await db
          .collection("products")
          .where("category", isEqualTo: "Accessories")
          .get()
          .then((value) {
        accessories.value = value.docs.length.toString();
      });
    } catch (exception) {
      print(exception);
    }
  }
}
