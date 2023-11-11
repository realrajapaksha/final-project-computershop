import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/data_models/dashboard_item_model.dart';
import '../../../../../routes/app_route.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/user_dashboard_controller.dart';

class ItemCard extends StatelessWidget {
  final DashboardItemModel model;

  const ItemCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserDashboardController>();
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.deepBlue),
              borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () async {
              await Navigator.pushNamed(context, AppRoute.productDetails,
                  arguments: model.id);
              controller.initialize();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Hero(
                      tag: model.image,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: model.image,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AppText(
                    text: model.name,
                    align: TextAlign.center,
                    fontColor: AppColors.deepBlue,
                    weight: FontWeight.w800,
                  ),
                  const Spacer(),
                  AppText(
                    text: "Rs.${model.price}",
                    fontColor: AppColors.deepBlue,
                    weight: FontWeight.w500,
                  ),
                  AppText(
                    text: model.qty > 0 ? "In Stock" : "Out of Stock",
                    fontColor:
                        model.qty > 0 ? AppColors.deepBlue : AppColors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
