import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';

class AccessoriesController extends GetxController{
  final accessoriesList = <DashboardItemModel>[].obs;
  final loading = false.obs;

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
      accessoriesList.add(const DashboardItemModel(
          id: "131124",
          name: "Bose QuietComfort® 45",
          category: "accessories",
          price: 98999.00,
          description: "Over-Ear Noise Cancelling Headphone. Black Color",
          qty: 10,
          image: "https://cdn.shopify.com/s/files/1/0822/2058/1183/files/Bose-QuietComfort-45-Wireless-Over-Ear-Noise-Cancelling-Headphones-Sri-Lanka-SimplyTek-2_596x_crop_center.jpg?v=1694425251"));
      accessoriesList.add(const DashboardItemModel(
          id: "1332",
          name: "AirPods Pro (2nd generation)",
          category: "accessories",
          price: 91999.00,
          description: "Wireless Headphone",
          qty: 0,
          image: "https://cdn.shopify.com/s/files/1/0822/2058/1183/files/AIRPODS-Pro-2nd-gen-simplytek-lk-2_596x_crop_center.png?v=1694426222"));
      accessoriesList.add(const DashboardItemModel(
          id: "5383",
          name: "Sony WH-1000XM5",
          category: "accessories",
          price: 129999.00,
          description: "Sony WH-1000XM5 Wireless Headphone",
          qty: 20,
          image: "https://cdn.shopify.com/s/files/1/0822/2058/1183/files/sony-1000xm5-simplytek-srilanka-3_596x_crop_center.jpg?v=1694425818"));
    } catch (exception) {
      //
    }
  }
}