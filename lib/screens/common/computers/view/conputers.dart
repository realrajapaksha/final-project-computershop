import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
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
    return SafeArea(
      child: Scaffold(
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
                            controller.computerList.map<Widget>((computer) {
                          return ComputerItem(model: computer);
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
