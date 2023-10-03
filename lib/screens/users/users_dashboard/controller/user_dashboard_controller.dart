import 'package:computershop/models/data_models/dashboard_item_model.dart';
import 'package:computershop/utils/shared_values.dart';
import 'package:get/get.dart';

class UserDashboardController extends GetxController {
  final name = SharedValues.shared.username.obs;

  final currentIndex = 0.obs;

  final computers = <DashboardItemModel>[].obs;
  final phones = <DashboardItemModel>[].obs;
  final accessories = <DashboardItemModel>[].obs;

  initialize() async {
    computers.add(const DashboardItemModel(
        id: "131124",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 20));
    computers.add(const DashboardItemModel(
        id: "1332",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 0));
    computers.add(const DashboardItemModel(
        id: "5383",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 20));

    computers.add(const DashboardItemModel(
        id: "53453483",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 0));


    phones.add(const DashboardItemModel(
        id: "131124",
        name: "Iphone 15 Pro Max 256",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 20));
    phones.add(const DashboardItemModel(
        id: "1332",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 0));
    phones.add(const DashboardItemModel(
        id: "5383",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 20));

    phones.add(const DashboardItemModel(
        id: "53453483",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 0));



    accessories.add(const DashboardItemModel(
        id: "131124",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 20));
    accessories.add(const DashboardItemModel(
        id: "1332",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 0));
    accessories.add(const DashboardItemModel(
        id: "5383",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 20));

    accessories.add(const DashboardItemModel(
        id: "53453483",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "Apple Macbook pro ",
        qty: 0));
  }
}
