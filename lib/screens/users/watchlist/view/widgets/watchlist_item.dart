import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/widgets/app_text.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                  CachedNetworkImage(
                    imageUrl:
                        "https://appleasia.lk/wp-content/uploads/2023/07/Untitled-design-4-860x860.png",
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Macbook Pro M1",
                        fontColor: Colors.black,
                        size: 15,
                        weight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Rs. 480000.00",
                        fontColor: Colors.black,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_circle_right_outlined,
              )
            ],
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
