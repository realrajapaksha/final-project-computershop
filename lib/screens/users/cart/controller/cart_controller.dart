import 'package:get/get.dart';

class CartController extends GetxController {
  final loading = false.obs;

  initialize() async {
    try {
      loading.value = true;
      await getCartDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getCartDetails() async {
    try {} catch (exception) {
      //
    }
  }
}