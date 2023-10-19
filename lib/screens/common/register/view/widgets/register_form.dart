import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/widgets/app_text_field.dart';
import '../../controller/register_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Obx(
      () => Column(
        children: [
          AppTextField(
              labelText: "Your Name",
              controller: controller.nameController,
              isEmpty: controller.nameEmpty.value,
              onValueChanged: (val) {
                controller.nameEmpty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Email",
            controller: controller.emailController,
            isEmpty: controller.emailEmpty.value,
            onValueChanged: (val) {
              controller.emailEmpty.value = val;
            },
            enable: false,
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Age",
            controller: controller.ageController,
            isEmpty: controller.ageEmpty.value,
            type: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            onValueChanged: (val) {
              controller.ageEmpty.value = val;
            },
            onChangedText: (String val) {
              if (val.trim() != "") {
                if (8 > int.parse(val) || int.parse(val) > 100) {
                  controller.ageEmpty.value = true;
                }
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
              labelText: "Gender",
              controller: controller.genderController,
              isEmpty: controller.genderEmpty.value,
              onValueChanged: (val) {
                controller.genderEmpty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
              labelText: "telephone 1",
              controller: controller.tele1Controller,
              isEmpty: controller.tele1Empty.value,
              onValueChanged: (val) {
                controller.tele1Empty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
              labelText: "Telephone 2",
              controller: controller.tele2Controller,
              isEmpty: controller.tele2Empty.value,
              onValueChanged: (val) {
                controller.tele2Empty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
              labelText: "City",
              controller: controller.cityController,
              isEmpty: controller.cityEmpty.value,
              onValueChanged: (val) {
                controller.cityEmpty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
              labelText: "Address",
              controller: controller.addressController,
              isEmpty: controller.addressEmpty.value,
              onValueChanged: (val) {
                controller.addressEmpty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
              labelText: "Country",
              controller: controller.countryController,
              isEmpty: controller.countryEmpty.value,
              onValueChanged: (val) {
                controller.countryEmpty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
