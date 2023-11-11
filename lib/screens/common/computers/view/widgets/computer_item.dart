import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/data_models/dashboard_item_model.dart';
import '../../../../../routes/app_route.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/computers_controller.dart';

class ComputerItem extends StatelessWidget {
  final DashboardItemModel model;

  const ComputerItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ComputerController>();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await Navigator.pushNamed(context, AppRoute.productDetails, arguments: model.id);
            controller.initialize();
          },
          child: Ink(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.deepBlue),
                borderRadius: BorderRadius.circular(12)),
            child: InkWell(

              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: const EdgeInsets.all(5),
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
                    Expanded(
                      child: AppText(
                        text: model.name,
                        align: TextAlign.center,
                        fontColor: AppColors.deepBlue,
                        weight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: AppText(
                        text: "Rs. ${model.price}0",
                        fontColor: AppColors.green26,
                        weight: FontWeight.w800,
                      ),
                    ),
                    Expanded(
                      child: AppText(
                        text: model.qty > 0 ? "In Stock" : "Out of Stock",
                        fontColor:
                            model.qty > 0 ? AppColors.deepBlue : AppColors.red,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
