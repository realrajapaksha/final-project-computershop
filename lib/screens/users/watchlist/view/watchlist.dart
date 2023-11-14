import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/watchlist_controller.dart';
import 'widgets/watchlist_item.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  final controller = Get.put(WatchlistController());

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<WatchlistController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
            backgroundColor: Colors.transparent,
            centerTitle: true,
            foregroundColor: Colors.white,
            title: const Text("Watchlist"),
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  controller.loading.value
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 15,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.watchList.length,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return WatchlistItem(
                              watchItem: controller.watchList[index],
                            );
                          })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
