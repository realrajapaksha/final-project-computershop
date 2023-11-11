import 'package:get/get.dart';

class OrderItemsController extends GetxController {

  final loading = false.obs;

  initialize() async {
    try {
      loading.value = true;
      await getOrderDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getOrderDetails() async {
    try {} catch (exception) {
      //
    }
  }
}