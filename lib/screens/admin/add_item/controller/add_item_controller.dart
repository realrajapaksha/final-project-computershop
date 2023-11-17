import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computershop/models/data_models/product_model.dart';
import 'package:computershop/utils/widgets/apps_alert.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../utils/shared_values.dart';

class AddItemController extends GetxController {
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

  final db = FirebaseFirestore.instance;

  initialize() async {
    try {} catch (exception) {
      //
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

      if (image.value.isEmpty) {
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
        await AppsAlerts().openLoading(context, "Adding Product..");
        final imageUrl = await saveImagesToFireStore(image.value);

        final model = ProductModel(
            productId: "",
            pname: nameController.text.trim(),
            quantity: int.parse(quantityController.text.trim()),
            price: int.parse(priceController.text.trim()),
            description: descriptionController.text.trim(),
            tags: selectedTag.value,
            image: imageUrl,
            category: selectedCategory.value);

        await db
            .collection("products")
            .add(model.toFireStore())
            .then((value) async {
          await AppsAlerts.closeAllDialogs(context);
          await AppsAlerts().openDialog(context, "Added", "Product added");
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
