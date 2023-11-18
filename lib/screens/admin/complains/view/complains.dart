import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/complains_controller.dart';

class Complains extends StatefulWidget {
  const Complains({super.key});

  @override
  State<Complains> createState() => _ComplainsState();
}

class _ComplainsState extends State<Complains> {
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
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          title: const Text("Complain List"),
        ),
        body: Obx(
          () => SingleChildScrollView(
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
                                  borderRadius: BorderRadius.circular(8),
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
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: controller
                                                .complainList[index].pname,
                                            fontColor: AppColors.highDeepBlue,
                                            size: 15,
                                            weight: FontWeight.w600,
                                          ),
                                          AppText(
                                            text: controller
                                                .complainList[index].note,
                                            fontColor: AppColors.highDeepBlue,
                                          ),
                                        ],
                                      ),
                                      AppText(
                                        text: DateFormat("yyyy-MM-dd").format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                controller
                                                    .complainList[index].date)),
                                        fontColor: AppColors.highDeepBlue,
                                        size: 13,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
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
