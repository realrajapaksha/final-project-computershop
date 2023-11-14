import 'package:computershop/utils/widgets/app_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/app_text_field.dart';
import '../../controller/profile_controller.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    final gender = ["Select Gender", "Male", "Female"];

    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 10,
          ),
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
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: controller.genderEmpty.value
                        ? Colors.red
                        : Colors.white)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color:
                      controller.genderEmpty.value ? Colors.red : Colors.white,
                ),
                dropdownColor: AppColors.highDeepBlue,
                value: controller.selectedGender.value,
                items: gender.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: AppText(
                        size: 14,
                        text: item.toString(),
                        fontColor: AppColors.white,
                        overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedGender.value = newValue;
                    controller.genderEmpty.value = false;
                  }
                },
              ),
            ),
          ),
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
          InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  controller.countryController.text = country.name;
                  controller.countryEmpty.value = false;
                },
              );
            },
            child: AppTextField(
                labelText: "Country",
                enable: false,
                controller: controller.countryController,
                isEmpty: controller.countryEmpty.value,
                onValueChanged: (val) {
                  controller.countryEmpty.value = val;
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          AppButton(
              title: "Update",
              onTapped: () {
                controller.updateUser(context);
              })
        ],
      ),
    );
  }
}
