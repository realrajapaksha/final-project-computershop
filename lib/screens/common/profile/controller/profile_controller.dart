import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/user_model.dart';
import '../../../../utils/shared_values.dart';
import '../../../../utils/widgets/apps_alert.dart';
import '../../splash/view/splash_screen.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final tele1Controller = TextEditingController();
  final tele2Controller = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();

  final nameEmpty = false.obs;
  final emailEmpty = false.obs;
  final genderEmpty = false.obs;
  final ageEmpty = false.obs;
  final tele1Empty = false.obs;
  final tele2Empty = false.obs;
  final cityEmpty = false.obs;
  final addressEmpty = false.obs;
  final countryEmpty = false.obs;
  final userEmpty = false.obs;

  final selectedGender = "Select Gender".obs;

  final selectedUser = "Customer".obs;

  final loading = false.obs;

  final email = SharedValues.shared.email.obs;

  final db = FirebaseFirestore.instance;

  initialize() async {
    try {
      loading.value = true;
      await getProfileDetails();
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }

  getProfileDetails() async {
    try {
      db.collection("users").doc(email.value).get().then((value) {
        if (value.exists) {
          nameController.text = value["fullName"];
          emailController.text = value["email"];
          ageController.text = value["age"].toString();
          tele1Controller.text = value["tele1"];
          tele2Controller.text = value["tele2"];
          cityController.text = value["city"];
          addressController.text = value["address"];
          countryController.text = value["country"];
          selectedGender.value = value["gender"];
        }
      });
    } catch (exception) {
      //
    }
  }

  Future<bool> validate() async {
    try {
      bool error = false;
      if (nameController.text.trim().isEmpty) {
        nameEmpty.value = true;
        error = true;
      }
      if (selectedGender.value.trim().isEmpty ||
          selectedGender.value == "Select Gender") {
        genderEmpty.value = true;
        error = true;
      }
      if (ageController.text.trim().isEmpty) {
        ageEmpty.value = true;
        error = true;
      }
      if (tele1Controller.text.trim().isEmpty) {
        tele1Empty.value = true;
        error = true;
      }

      if (cityController.text.trim().isEmpty) {
        cityEmpty.value = true;
        error = true;
      }
      if (addressController.text.trim().isEmpty) {
        addressEmpty.value = true;
        error = true;
      }
      if (countryController.text.trim().isEmpty) {
        countryEmpty.value = true;
        error = true;
      }

      return error;
    } catch (exception) {
      return true;
    }
  }

  updateUser(BuildContext context) async {
    try {
      if (await validate()) {
        // empty details found
        return;
      }

      await AppsAlerts().openLoading(context, "Updating Profile");

      final model = UserModel(
          fullName: nameController.text.trim(),
          age: int.parse(ageController.text.trim()),
          tele1: tele1Controller.text.trim(),
          tele2: tele2Controller.text.trim(),
          city: cityController.text.trim(),
          address: addressController.text.trim(),
          country: countryController.text.trim(),
          gender: selectedGender.value,
          id: '',
          email: '',
          image: '',
          type: '',
          status: '');

      await db
          .collection("users")
          .doc(emailController.text.trim())
          .update(model.toUpdateFireStore())
          .then((value) {
        initialize();
      });

      await AppsAlerts.closeAllDialogs(context);
    } catch (exception) {
      initialize();
      await AppsAlerts.closeAllDialogs(context);
    }
  }

  logOut(context) async {
    try {
      SharedValues.shared.setType("");
      SharedValues.shared.setStatus("");
      SharedValues.shared.setUsername("");
      SharedValues.shared.setEmail("");
      SharedValues.shared.setSignedIn(false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => SplashScreen()), (Route route) => false);
    } catch (exception) {
      //
    }
  }
}
