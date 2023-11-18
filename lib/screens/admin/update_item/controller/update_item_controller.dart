import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../models/data_models/product_model.dart';
import '../../../../utils/widgets/apps_alert.dart';

class UpdateItemController extends GetxController {
  final productId = "".obs;
  late ProductModel product;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  final nameEmpty = false.obs;
  final descriptionEmpty = false.obs;
  final priceEmpty = false.obs;
  final quantityEmpty = false.obs;
  final imageEmpty = false.obs;

  final selectedTag = "High".obs;
  final selectedCategory = "Computer".obs;

  final image = Uint8List(0).obs;
  final imageUrl = "".obs;

  final db = FirebaseFirestore.instance;

  final loading = false.obs;

  initialize(String navId) async {
    try {
      productId.value = navId;
      await getProductDetails();
    } catch (exception) {
      //
    }
  }

  getProductDetails() async {
    try {
      if (productId.value.trim().isEmpty) {
        return;
      }
      loading.value = true;

      await db.collection("products").doc(productId.value).get().then((value) {
        if (value.exists) {
          product = ProductModel(
              productId: value.id,
              pname: value["pname"],
              quantity: value["quantity"],
              price: value["price"],
              description: value["description"],
              tags: value["tags"],
              image: value["image"],
              category: value["category"]);

          nameController.text = product.pname;
          descriptionController.text = product.description;
          priceController.text = product.price.toString();
          quantityController.text = product.quantity.toString();
          imageUrl.value = product.image;

          selectedTag.value = product.tags;
          selectedCategory.value = product.category;
        }
      });
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  openImage() async {
    bool storage = true;
    bool photos = true;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      photos = await Permission.photos.status.isGranted;
    } else {
      storage = await Permission.storage.status.isGranted;
    }

    if (storage && photos) {
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (result != null) {
        image.value = await result.readAsBytes();
        imageEmpty.value = false;
      }
    } else {
      await Permission.storage.request();
      await Permission.photos.request();
    }
  }

  Future<bool> validate() async {
    try {
      bool error = true;

      if (nameController.text.trim().isEmpty) {
        nameEmpty.value = true;
        error = false;
      }

      if (descriptionController.text.trim().isEmpty) {
        descriptionEmpty.value = true;
        error = false;
      }

      if (priceController.text.trim().isEmpty) {
        priceEmpty.value = true;
        error = false;
      }

      if (quantityController.text.trim().isEmpty) {
        quantityEmpty.value = true;
        error = false;
      }

      if (image.value.isEmpty && imageUrl.value.isEmpty) {
        imageEmpty.value = true;
        error = false;
      }

      int.parse(quantityController.text.trim());
      int.parse(priceController.text.trim());
      return error;
    } catch (exception) {
      return false;
    }
  }

  addProduct(context) async {
    try {
      if (await validate()) {
        await AppsAlerts().openLoading(context, "Updating Product..");
        String newImageUrl = imageUrl.value;
        if (image.value.isNotEmpty) {
          newImageUrl = await saveImagesToFireStore(image.value);
        }

        final model = ProductModel(
            productId: product.productId,
            pname: nameController.text.trim(),
            quantity: int.parse(quantityController.text.trim()),
            price: int.parse(priceController.text.trim()),
            description: descriptionController.text.trim(),
            tags: selectedTag.value,
            image: newImageUrl,
            category: selectedCategory.value);

        await db
            .collection("products")
            .doc(product.productId)
            .update(model.toFireStore())
            .then((value) async {
          await AppsAlerts.closeAllDialogs(context);
          await AppsAlerts()
              .openDialog(context, "Updated", "Product Updated complete.");
          await AppsAlerts.closeAllDialogs(context);
          return;
        });
      } else {
        return;
      }
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
      await AppsAlerts().openDialog(context, "Error", "Try again");
    }
  }

  Future<String> saveImagesToFireStore(Uint8List file) async {
    String url = "";
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef
          .child("products/${DateTime.now().microsecondsSinceEpoch}.png");
      await imageRef.putData(file);
      url = await imageRef.getDownloadURL();

      return url;
    } catch (e) {
      rethrow;
    }
  }
}
