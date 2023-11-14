import 'package:get/get.dart';

import '../../../../models/data_models/dashboard_item_model.dart';

class ComputerController extends GetxController {
  final computerList = <DashboardItemModel>[].obs;
  final loading = false.obs;

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

      computerList.add(const DashboardItemModel(
          id: "v2TaapF9oALBSUhqrJ6t",
          name: "Macbook Pro M2",
          category: "computer",
          price: 485000,
          description: "MacBook Air 15” M2",
          qty: 20,
          image:
              "https://appleasia.lk/wp-content/uploads/2023/07/Untitled-design-4-860x860.png"));
      computerList.add(const DashboardItemModel(
          id: "1332",
          name: "MacBook Pro 13″ M2",
          category: "computer",
          price: 535000,
          description: "Apple Macbook pro ",
          qty: 0,
          image:
              "https://appleasia.lk/wp-content/uploads/2023/04/Apple-MacBook-Pro-M2-Space-Grey-Latest-Price-In-Sri-Lanka-2.webp"));
      computerList.add(const DashboardItemModel(
          id: "5383",
          name: "MacBook Air M2",
          category: "computer",
          price: 325000,
          description: "Apple Macbook pro ",
          qty: 20,
          image:
              "https://appleasia.lk/wp-content/uploads/2023/04/macbook_air_M2_2022_Price-in-srilanka-Apple-Asia-Spacegrey-1-768x768.webp"));

      computerList.add(const DashboardItemModel(
          id: "53453483",
          name: "MacBook Air M1",
          category: "computer",
          price: 295000,
          description: "Apple Macbook pro ",
          qty: 0,
          image:
              "https://appleasia.lk/wp-content/uploads/2023/04/Apple-MacBook-Air-M1-Silver-Latest-Price-In-Sri-Lanka-1-768x768.webp"));
    } catch (exception) {
      //
    }
  }
}
