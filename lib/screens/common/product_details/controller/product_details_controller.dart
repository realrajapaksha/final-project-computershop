import 'package:get/get.dart';

import '../../../../models/data_models/product_model.dart';

class ProductDetailsController extends GetxController {
  final product = ProductModel(
      productId: "2342",
      pname: "Macbook Pro M2",
      quantity: 10,
      price: 485000.00,
      description:
          "macOS is the most advanced desktop operating system in the world. macOS Monterey introduces powerful new features to help you connect, share, and create like never before.",
      tags: "mac",
      image:
          "https://appleasia.lk/wp-content/uploads/2023/07/Untitled-design-4-860x860.png",
      category: "computer").obs;
  final loading = false.obs;

  initialize() async {
    try {
      loading.value = true;
      await getProductDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getProductDetails() async {
    try {} catch (exception) {
      //
    }
  }
}
