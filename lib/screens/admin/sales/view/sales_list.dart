import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/sales_controller.dart';
import 'widgets/sales_board.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final controller = Get.put(SalesController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<SalesController>();
    super.dispose();
  }

  pickDate(bool from) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: from
          ? DateTime.fromMillisecondsSinceEpoch(controller.startDate.value)
          : DateTime.fromMillisecondsSinceEpoch(controller.endDate.value),
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2030, 12),
      helpText: 'Select Date',
    );

    if (newDate != null) {
      if (from) {
        controller.startDate.value = newDate.millisecondsSinceEpoch;
      } else {
        final today = DateTime.now();
        if (DateTime(newDate.year, newDate.month, newDate.day) ==
            DateTime(today.year, today.month, today.day)) {
          controller.endDate.value = today.millisecondsSinceEpoch;
        } else {
          controller.endDate.value = newDate.millisecondsSinceEpoch;
        }
      }
    }

    controller.initialize();
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
          title: const Text("Sales"),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  pickDate(true);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Column(
                                    children: [
                                      AppText(
                                          size: 15,
                                          text: DateFormat("yyyy-MM-dd").format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      controller
                                                          .startDate.value))),
                                      const AppText(text: "From Date")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  pickDate(false);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Column(
                                    children: [
                                      AppText(
                                          size: 15,
                                          text: DateFormat("yyyy-MM-dd").format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      controller
                                                          .endDate.value))),
                                      const AppText(text: "To Date")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SalesBoard()
                      ],
                    ),
                    controller.loading.value
                        ? const Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: CupertinoActivityIndicator(
                              radius: 20,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
