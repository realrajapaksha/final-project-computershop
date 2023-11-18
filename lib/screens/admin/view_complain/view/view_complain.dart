import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../../complains/controller/complains_controller.dart';

class ViewComplain extends StatefulWidget {
  const ViewComplain({super.key});

  @override
  State<ViewComplain> createState() => _ViewComplainState();
}

class _ViewComplainState extends State<ViewComplain> {
  final controller = Get.put(ComplainsController());

  @override
  void initState() {
    super.initState();
    controller.getComplainList();
  }

  @override
  void dispose() {
    Get.delete<ComplainsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.highDeepBlue,
              AppColors.deepBlue,
              AppColors.lowDeepBlue
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("View Complains"),
        ),
        body: Obx(()=> SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: controller.loading.value
                ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            )
                : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.complainList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration:
                      const BoxDecoration(color: Colors.white70),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl:
                              controller.complainList[index].image,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: controller.complainList[index].pname,
                            fontColor: AppColors.highDeepBlue,
                            size: 15,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        ),
      ),
    );
  }
}
