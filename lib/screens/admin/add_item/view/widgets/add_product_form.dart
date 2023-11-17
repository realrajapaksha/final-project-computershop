import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/app_text_field.dart';
import '../../controller/add_item_controller.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddItemController>();

    final tag = ["Low", "Middle", "High", "Special"];

    final category = ["Computer", "Phone", "Accessories"];

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                controller.openImage();
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    image: controller.image.value.isNotEmpty
                        ? DecorationImage(
                            image: MemoryImage(controller.image.value))
                        : null,
                    color: Colors.grey,
                    border: Border.all(
                      width: 2,
                        color: controller.imageEmpty.value
                            ? Colors.red
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AppTextField(
              labelText: "Product Name",
              controller: controller.nameController,
              isEmpty: controller.nameEmpty.value,
              onValueChanged: (val) {
                controller.nameEmpty.value = val;
              }),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Description",
            controller: controller.descriptionController,
            isEmpty: controller.descriptionEmpty.value,
            isLargeText: true,
            minLines: 5,
            action: TextInputAction.newline,
            type: TextInputType.multiline,
            onValueChanged: (val) {
              controller.descriptionEmpty.value = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Price Rs.",
            controller: controller.priceController,
            isEmpty: controller.priceEmpty.value,
            type: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            onValueChanged: (val) {
              controller.priceEmpty.value = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Quantity",
            controller: controller.quantityController,
            isEmpty: controller.quantityEmpty.value,
            type: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            onValueChanged: (val) {
              controller.quantityEmpty.value = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const AppText(text: "Select Product Category"),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: Colors.white,
                ),
                dropdownColor: AppColors.highDeepBlue,
                value: controller.selectedCategory.value,
                items: category.map((String item) {
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
                    controller.selectedCategory.value = newValue;
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          controller.selectedCategory.value == "Computer"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(text: "Select Product Tag"),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.white,
                          ),
                          dropdownColor: AppColors.highDeepBlue,
                          value: controller.selectedTag.value,
                          items: tag.map((String item) {
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
                              controller.selectedTag.value = newValue;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
