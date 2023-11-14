import 'package:get/get.dart';
import '../../../../models/data_models/dashboard_item_model.dart';
import '../../../../utils/shared_values.dart';

class UserDashboardController extends GetxController {
  final name = SharedValues.shared.username.obs;

  final computers = <DashboardItemModel>[].obs;
  final phones = <DashboardItemModel>[].obs;
  final accessories = <DashboardItemModel>[].obs;

  initialize() async {
    computers.clear();
    phones.clear();
    accessories.clear();

    computers.add(const DashboardItemModel(
        id: "v2TaapF9oALBSUhqrJ6t",
        name: "Macbook Pro M2",
        category: "computer",
        price: 485000,
        description: "MacBook Air 15” M2",
        qty: 20,
        image:
            "https://appleasia.lk/wp-content/uploads/2023/07/Untitled-design-4-860x860.png"));
    computers.add(const DashboardItemModel(
        id: "1332",
        name: "MacBook Pro 13″ M2",
        category: "computer",
        price: 535000,
        description: "Apple Macbook pro ",
        qty: 0,
        image:
            "https://appleasia.lk/wp-content/uploads/2023/04/Apple-MacBook-Pro-M2-Space-Grey-Latest-Price-In-Sri-Lanka-2.webp"));
    computers.add(const DashboardItemModel(
        id: "5383",
        name: "MacBook Air M2",
        category: "computer",
        price: 325000,
        description: "Apple Macbook pro ",
        qty: 20,
        image:
            "https://appleasia.lk/wp-content/uploads/2023/04/macbook_air_M2_2022_Price-in-srilanka-Apple-Asia-Spacegrey-1-768x768.webp"));

    computers.add(const DashboardItemModel(
        id: "53453483",
        name: "MacBook Air M1",
        category: "computer",
        price: 295000,
        description: "Apple Macbook pro ",
        qty: 0,
        image:
            "https://appleasia.lk/wp-content/uploads/2023/04/Apple-MacBook-Air-M1-Silver-Latest-Price-In-Sri-Lanka-1-768x768.webp"));

    phones.add(const DashboardItemModel(
        id: "131124",
        name: "iPhone 15 Pro Max 256",
        category: "phone",
        price: 525000.00,
        description: "",
        qty: 20,
        image:
            "https://www.gnextstore.lk/uploads/product_image_upload/Product_1376_1697791897.png"));
    phones.add(const DashboardItemModel(
        id: "1332",
        name: "iPhone 14 Pro Max 128",
        category: "phone",
        price: 414000.00,
        description: "",
        qty: 0,
        image:
            "https://www.gnextstore.lk/uploads/product_image_upload/Product_1194_1666623130.png"));
    phones.add(const DashboardItemModel(
        id: "5383",
        name: "iPhone 15 Plus",
        category: "phone",
        price: 366000.00,
        description: "",
        qty: 20,
        image:
            "https://www.gnextstore.lk/uploads/product_image_upload/Product_1346_1697781285.png"));

    phones.add(const DashboardItemModel(
        id: "53453483",
        name: "Google Pixel 7 Smartphone",
        category: "phone",
        price: 158999.00,
        description: "Google Pixel 7 Smartphone",
        qty: 5,
        image:
            "https://simplytek.lk/cdn/shop/files/Pixel-7-Black-Simplytek-LK-1_596x_crop_center.jpg?v=1694427133"));

    accessories.add(const DashboardItemModel(
        id: "131124",
        name: "Bose QuietComfort® 45 Wireless",
        category: "accessories",
        price: 98999.00,
        description: "Over-Ear Noise Cancelling Headphone. Black Color",
        qty: 10,
        image:
            "https://cdn.shopify.com/s/files/1/0822/2058/1183/files/Bose-QuietComfort-45-Wireless-Over-Ear-Noise-Cancelling-Headphones-Sri-Lanka-SimplyTek-2_596x_crop_center.jpg?v=1694425251"));
    accessories.add(const DashboardItemModel(
        id: "1332",
        name: "AirPods Pro (2nd generation)",
        category: "accessories",
        price: 91999.00,
        description: "Apple Macbook pro ",
        qty: 0,
        image:
            "https://cdn.shopify.com/s/files/1/0822/2058/1183/files/AIRPODS-Pro-2nd-gen-simplytek-lk-2_596x_crop_center.png?v=1694426222"));
    accessories.add(const DashboardItemModel(
        id: "5383",
        name: "Sony WH-1000XM5",
        category: "accessories",
        price: 129999.00,
        description: "Sony WH-1000XM5 Wireless Headphone",
        qty: 20,
        image:
            "https://cdn.shopify.com/s/files/1/0822/2058/1183/files/sony-1000xm5-simplytek-srilanka-3_596x_crop_center.jpg?v=1694425818"));
  }

  getComputers() async {}

  getPhones() async {}

  getAccessories() async {}
}
