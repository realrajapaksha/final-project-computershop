import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/employee_approval_model.dart';

class EmployeeController extends GetxController {
  final db = FirebaseFirestore.instance;

  final pendingList = <EmployeeApprovalModel>[].obs;

  final loading = false.obs;

  getApprovalList() async {
    try {
      loading.value = true;
      pendingList.clear();
      await db
          .collection("users")
          .where("status", isEqualTo: "Pending")
          .where("type", isEqualTo: "Employee")
          .get()
          .then((value) {
        for (var doc in value.docs) {
          String imgUrl = doc["image"];
          if (doc["image"] == "null") {
            imgUrl =
                "https://firebasestorage.googleapis.com/v0/b/nanotek-esoft.appspot.com/o/download.jpg?alt=media&token=a805e081-fe36-47a0-85c4-4a7deae811d2";
          }
          pendingList.add(EmployeeApprovalModel(
              userId: doc.id,
              fullName: doc["fullName"],
              tele1: doc["tele1"],
              status: doc["status"],
              image: imgUrl));
        }
      });
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  approve(String userId) async {
    try{
      final updateData = {
        "status": "Approved",
      };

      await db.collection("users").doc(userId).update(updateData).then((value) {

      });
      getApprovalList();
    }catch(exception){
      getApprovalList();
    }
  }

  reject(String userId) async {
    try{
      final updateData = {
        "status": "Rejected",
      };

      await db.collection("users").doc(userId).update(updateData).then((value) {

      });
      getApprovalList();
    }catch(exception){
      //
    }
  }
}
