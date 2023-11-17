import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/data_models/watchlist_model.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/watchlist_controller.dart';

class WatchlistItem extends StatelessWidget {
  final WatchlistModel watchItem;

  const WatchlistItem({super.key, required this.watchItem});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WatchlistController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: watchItem.image,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: watchItem.pname,
                        size: 15,
                        weight: FontWeight.w800,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Rs. ${watchItem.price}.00",
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                splashRadius: 20,
                color: Colors.white70,
                onPressed: () {
                  controller.deleteCartItem(context, watchItem.watchId);
                },
                icon: const Icon(CupertinoIcons.delete),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
