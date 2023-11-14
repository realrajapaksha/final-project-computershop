import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../models/data_models/user_model.dart';
import '../../../../models/navigate_models/register_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../services/api_services/remote_service.dart';
import '../../../../utils/shared_values.dart';

class RegisterController extends GetxController {
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

  late GoogleSignInAccount account;

  final db = FirebaseFirestore.instance;

  initialize(RegisterNavModel navModel) async {
    try {
      account = navModel.account;
      nameController.text = account.displayName.toString();
      emailController.text = account.email.toString();
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
      if (emailController.text.trim().isEmpty) {
        emailEmpty.value = true;
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

  register(context) async {
    try {
      if (await validate()) {
        // empty details found
        return;
      }

      String status = "Approved";
      if (selectedUser.value == "Employee") {
        status = "Pending";
      }

      final model = UserModel(
          id: account.id,
          email: account.email,
          image: account.photoUrl.toString(),
          fullName: nameController.text.trim(),
          age: int.parse(ageController.text.trim()),
          tele1: tele1Controller.text.trim(),
          tele2: tele2Controller.text.trim(),
          city: cityController.text.trim(),
          address: addressController.text.trim(),
          country: countryController.text.trim(),
          gender: selectedGender.value,
          type: selectedUser.value,
          status: status);

      // create account
      final result = await RemoteService.userRegister(userModel: model);

      if (result != false) {
        // account crated
        SharedValues.shared.setEmail(account.email);
        SharedValues.shared.setSignedIn(true);
        SharedValues.shared.setUsername(nameController.text.trim());
        await Navigator.popAndPushNamed(context, AppRoute.userHome);
      } else {
        // unable to create
      }
    } catch (exception) {
      // error
      print(exception);
    }
  }
}
