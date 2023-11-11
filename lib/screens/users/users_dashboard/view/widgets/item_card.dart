import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../models/data_models/dashboard_item_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';

class ItemCard extends StatelessWidget {
  final DashboardItemModel model;

  const ItemCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.deepBlue),
              borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {

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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: model.image,
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
