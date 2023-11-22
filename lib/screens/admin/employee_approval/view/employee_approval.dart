import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/employee_approval_controller.dart';

class EmployeeApproval extends StatefulWidget {
  const EmployeeApproval({super.key});

  @override
  State<EmployeeApproval> createState() => _EmployeeApprovalState();
}

class _EmployeeApprovalState extends State<EmployeeApproval> {
  final controller = Get.put(EmployeeController());

  @override
  void initState() {
    super.initState();
    controller.getApprovalList();
  }

  @override
  void dispose() {
    Get.delete<EmployeeController>();
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
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            centerTitle: true,
            title: const Text("Pending Employee List"),
          ),
          body: SingleChildScrollView(
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
                      itemCount: controller.pendingList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            decoration:
                                const BoxDecoration(color: Colors.white70),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            controller.pendingList[index].image,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: controller
                                              .pendingList[index].fullName,
                                          fontColor: AppColors.highDeepBlue,
                                          align: TextAlign.start,
                                          size: 15,
                                          weight: FontWeight.w600,
                                        ),
                                        AppText(
                                          text:
                                              "Email : ${controller.pendingList[index].userId}",
                                          fontColor: AppColors.highDeepBlue,
                                          align: TextAlign.start,
                                          weight: FontWeight.w600,
                                        ),
                                        AppText(
                                          text:
                                              "Telephone : ${controller.pendingList[index].tele1}",
                                          fontColor: AppColors.highDeepBlue,
                                          align: TextAlign.start,
                                          weight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          await controller.approve(controller
                                              .pendingList[index].userId);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          color: AppColors.green26,
                                          child: const AppText(
                                            text: "Approve",
                                            align: TextAlign.center,
                                            fontColor: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          await controller.reject(controller
                                              .pendingList[index].userId);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          color: AppColors.red,
                                          child: const AppText(
                                            text: "Reject",
                                            align: TextAlign.center,
                                            fontColor: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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
