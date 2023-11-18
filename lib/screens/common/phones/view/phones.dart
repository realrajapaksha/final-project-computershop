import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/phone_controller.dart';
import 'widgets/phone_item.dart';

class Phones extends StatefulWidget {
  const Phones({super.key});

  @override
  State<Phones> createState() => _PhonesState();
}

class _PhonesState extends State<Phones> {
  final controller = Get.put(PhoneController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<PhoneController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Phones"),
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
                        controller.filteredList.clear();
                      }else{
                        if (search.isNotEmpty) {
                          controller.searchPhones(search);
                        }
                      }
                    },
                    onSubmitted: (String? search) {
                      if (search != null) {
                        controller.searchPhones(search);
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  child: Row(
                    children: [],
                  ),
                ),
                controller.loading.value
                    ? const Center(
                        child: CupertinoActivityIndicator(
                        color: AppColors.deepBlue,
                      ))
                    : controller.filteredList.isNotEmpty
                        ? GridView.count(
                            shrinkWrap: true,
                            childAspectRatio: .7,
                            physics: const ScrollPhysics(),
                            crossAxisCount: 3,
                            children:
                                controller.filteredList.map<Widget>((computer) {
                              return PhoneItem(model: computer);
                            }).toList(),
                          )
                        : GridView.count(
                            shrinkWrap: true,
                            childAspectRatio: .7,
                            physics: const ScrollPhysics(),
                            crossAxisCount: 3,
                            children:
                                controller.phonesList.map<Widget>((computer) {
                              return PhoneItem(model: computer);
                            }).toList(),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
