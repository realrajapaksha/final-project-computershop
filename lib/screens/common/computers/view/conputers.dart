import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/computers_controller.dart';
import 'widgets/computer_item.dart';

class Computers extends StatefulWidget {
  const Computers({super.key});

  @override
  State<Computers> createState() => _ComputersState();
}

class _ComputersState extends State<Computers> {
  final controller = Get.put(ComputerController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<ComputerController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Computers"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                child: CupertinoSearchTextField(
                  onChanged: (String search) {
                    if (search.trim().isEmpty) {
                      controller.initialize();
                    }
                  },
                  onSubmitted: (String? search) {
                    if (search != null) {
                      controller.searchComputers(search);
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: AppText(
                        text: "Sort By :",
                        fontColor: AppColors.black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (controller.priceSort.value == 0) {
                            controller.priceSort.value = 1;
                          } else if (controller.priceSort.value == 1) {
                            controller.priceSort.value = 2;
                          } else {
                            controller.priceSort.value = 0;
                          }
                          controller.sortPriceList();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          color: controller.priceSort.value == 0
                              ? Colors.transparent
                              : controller.priceSort.value == 1
                                  ? Colors.green
                                  : Colors.orangeAccent,
                          child: AppText(
                            text: "Price",
                            align: TextAlign.center,
                            fontColor: controller.priceSort.value == 0
                                ? Colors.black
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (controller.nameSort.value == 0) {
                            controller.nameSort.value = 1;
                          } else if (controller.nameSort.value == 1) {
                            controller.nameSort.value = 2;
                          } else {
                            controller.nameSort.value = 0;
                          }
                          controller.sortNameList();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          color: controller.nameSort.value == 0
                              ? Colors.transparent
                              : controller.nameSort.value == 1
                                  ? Colors.green
                                  : Colors.orangeAccent,
                          child: AppText(
                            text: "A-Z",
                            align: TextAlign.center,
                            fontColor: controller.nameSort.value == 0
                                ? Colors.black
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.loading.value
                  ? const Center(
                      child: CupertinoActivityIndicator(
                      color: AppColors.deepBlue,
                    ))
                  : GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: .7,
                      physics: const ScrollPhysics(),
                      crossAxisCount: 3,
                      children: controller.computerList.map<Widget>((computer) {
                        return ComputerItem(model: computer);
                      }).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
