import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/accessories_controller.dart';
import 'widgets/accessories_item.dart';

class Accessories extends StatefulWidget {
  const Accessories({super.key});

  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  final controller = Get.put(AccessoriesController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<AccessoriesController>();
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
          title: const Text("Accessories"),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  child: CupertinoSearchTextField(),
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
                    : GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: .7,
                        physics: ScrollPhysics(),
                        crossAxisCount: 3,
                        children:
                            controller.accessoriesList.map<Widget>((computer) {
                          return AccessoriesItem(model: computer);
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
